import { useState, useRef, useCallback, useEffect } from 'react'
import styles from './VoiceRecorder.module.css'

export type RecordingMode = 'with-lyrics' | 'from-memory'

export interface VoiceRecorderProps {
  mode: RecordingMode
  onModeChange: (mode: RecordingMode) => void
  disabled?: boolean
  className?: string
}

interface RecordingState {
  status: 'idle' | 'recording' | 'recorded' | 'playing'
  duration: number
  audioBlob: Blob | null
  audioUrl: string | null
}

export function VoiceRecorder({ 
  mode, 
  onModeChange, 
  disabled = false,
  className 
}: VoiceRecorderProps) {
  const [state, setState] = useState<RecordingState>({
    status: 'idle',
    duration: 0,
    audioBlob: null,
    audioUrl: null
  })
  
  const [countdown, setCountdown] = useState<number | null>(null)
  const [isMediaRecorderSupported, setIsMediaRecorderSupported] = useState(true)
  
  const mediaRecorderRef = useRef<MediaRecorder | null>(null)
  const audioRef = useRef<HTMLAudioElement | null>(null)
  const timerRef = useRef<number | null>(null)
  const countdownRef = useRef<number | null>(null)
  const chunksRef = useRef<Blob[]>([])

  useEffect(() => {
    // Check MediaRecorder support
    setIsMediaRecorderSupported(typeof MediaRecorder !== 'undefined' && !!navigator.mediaDevices?.getUserMedia)
  }, [])

  const cleanup = useCallback(() => {
    if (timerRef.current) {
      clearInterval(timerRef.current)
      timerRef.current = null
    }
    if (countdownRef.current) {
      clearTimeout(countdownRef.current)
      countdownRef.current = null
    }
    if (mediaRecorderRef.current?.state === 'recording') {
      mediaRecorderRef.current.stop()
    }
  }, [])

  useEffect(() => {
    return cleanup
  }, [cleanup])

  const startCountdown = useCallback(() => {
    setCountdown(3)
    let count = 3
    
    countdownRef.current = setInterval(() => {
      count--
      if (count > 0) {
        setCountdown(count)
      } else {
        setCountdown(null)
        if (countdownRef.current) {
          clearInterval(countdownRef.current)
          countdownRef.current = null
        }
        startActualRecording()
      }
    }, 1000)
  }, [])

  const startActualRecording = useCallback(async () => {
    try {
      const stream = await navigator.mediaDevices.getUserMedia({ 
        audio: {
          echoCancellation: true,
          noiseSuppression: true,
          autoGainControl: true
        }
      })

      chunksRef.current = []
      
      const mediaRecorder = new MediaRecorder(stream, {
        mimeType: MediaRecorder.isTypeSupported('audio/webm;codecs=opus') 
          ? 'audio/webm;codecs=opus' 
          : 'audio/webm'
      })

      mediaRecorder.ondataavailable = (event) => {
        if (event.data.size > 0) {
          chunksRef.current.push(event.data)
        }
      }

      mediaRecorder.onstop = () => {
        stream.getTracks().forEach(track => track.stop())
        
        const audioBlob = new Blob(chunksRef.current, { type: mediaRecorder.mimeType })
        const audioUrl = URL.createObjectURL(audioBlob)
        
        setState(prev => ({
          ...prev,
          status: 'recorded',
          audioBlob,
          audioUrl
        }))
        
        if (timerRef.current) {
          clearInterval(timerRef.current)
          timerRef.current = null
        }
      }

      mediaRecorderRef.current = mediaRecorder
      mediaRecorder.start(100) // Collect data every 100ms
      
      setState(prev => ({ ...prev, status: 'recording', duration: 0 }))
      
      timerRef.current = setInterval(() => {
        setState(prev => ({ ...prev, duration: prev.duration + 0.1 }))
      }, 100)

    } catch (error) {
      console.error('Error starting recording:', error)
      setState(prev => ({ ...prev, status: 'idle' }))
    }
  }, [])

  const startRecording = useCallback(() => {
    if (disabled || !isMediaRecorderSupported) return
    
    // Clear previous recording
    if (state.audioUrl) {
      URL.revokeObjectURL(state.audioUrl)
    }
    
    setState(prev => ({
      ...prev,
      audioBlob: null,
      audioUrl: null,
      duration: 0
    }))
    
    startCountdown()
  }, [disabled, isMediaRecorderSupported, state.audioUrl, startCountdown])

  const stopRecording = useCallback(() => {
    if (mediaRecorderRef.current?.state === 'recording') {
      mediaRecorderRef.current.stop()
    }
    
    if (countdownRef.current) {
      clearTimeout(countdownRef.current)
      countdownRef.current = null
      setCountdown(null)
      setState(prev => ({ ...prev, status: 'idle' }))
    }
  }, [])

  const playRecording = useCallback(() => {
    if (!state.audioUrl) return
    
    if (audioRef.current) {
      audioRef.current.src = state.audioUrl
      audioRef.current.play()
      setState(prev => ({ ...prev, status: 'playing' }))
      
      audioRef.current.onended = () => {
        setState(prev => ({ ...prev, status: 'recorded' }))
      }
    }
  }, [state.audioUrl])

  const deleteRecording = useCallback(() => {
    if (audioRef.current) {
      audioRef.current.pause()
      audioRef.current.currentTime = 0
    }
    
    if (state.audioUrl) {
      URL.revokeObjectURL(state.audioUrl)
    }
    
    setState(prev => ({
      ...prev,
      status: 'idle',
      duration: 0,
      audioBlob: null,
      audioUrl: null
    }))
  }, [state.audioUrl])

  const formatTime = (seconds: number): string => {
    const mins = Math.floor(seconds / 60)
    const secs = Math.floor(seconds % 60)
    return `${mins}:${secs.toString().padStart(2, '0')}`
  }

  const getStatusText = (): string => {
    if (countdown) return `Recording in ${countdown}...`
    
    switch (state.status) {
      case 'idle': return 'Ready to record'
      case 'recording': return `Recording... ${formatTime(state.duration)}`
      case 'recorded': return `Recorded ${formatTime(state.duration)}`
      case 'playing': return 'Playing...'
      default: return 'Ready'
    }
  }

  if (!isMediaRecorderSupported) {
    return (
      <div className={`${styles.card} ${className || ''}`}>
        <p className={styles.unsupported}>
          Voice recording is not supported in this browser.
        </p>
      </div>
    )
  }

  return (
    <div className={`${styles.card} ${className || ''}`}>
      <audio ref={audioRef} style={{ display: 'none' }} />
      
      <div className={styles.header}>
        <h3 className={styles.title}>Practice Recording</h3>
        <div className={styles.modeSelector}>
          <button
            type="button"
            className={`${styles.modeButton} ${mode === 'with-lyrics' ? styles.modeButtonActive : ''}`}
            onClick={() => onModeChange('with-lyrics')}
            disabled={disabled || state.status === 'recording' || countdown !== null}
          >
            Practice with Lyrics
          </button>
          <button
            type="button"
            className={`${styles.modeButton} ${mode === 'from-memory' ? styles.modeButtonActive : ''}`}
            onClick={() => onModeChange('from-memory')}
            disabled={disabled || state.status === 'recording' || countdown !== null}
          >
            Practice from Memory
          </button>
        </div>
      </div>

      <div className={styles.status}>
        <div className={`${styles.statusIndicator} ${countdown || state.status === 'recording' ? styles.statusRecording : ''}`}>
          {countdown && <span className={styles.countdown}>{countdown}</span>}
          {!countdown && (
            <span className={styles.statusIcon}>
              {state.status === 'idle' && '●'}
              {state.status === 'recording' && '🔴'}
              {state.status === 'recorded' && '✓'}
              {state.status === 'playing' && '▶'}
            </span>
          )}
        </div>
        <span className={styles.statusText}>{getStatusText()}</span>
      </div>

      <div className={styles.controls}>
        {state.status === 'idle' && (
          <button
            type="button"
            className={`${styles.controlButton} ${styles.startButton}`}
            onClick={startRecording}
            disabled={disabled}
          >
            Start Recording
          </button>
        )}

        {(state.status === 'recording' || countdown !== null) && (
          <button
            type="button"
            className={`${styles.controlButton} ${styles.stopButton}`}
            onClick={stopRecording}
          >
            Stop Recording
          </button>
        )}

        {state.status === 'recorded' && (
          <div className={styles.recordedControls}>
            <button
              type="button"
              className={`${styles.controlButton} ${styles.playButton}`}
              onClick={playRecording}
              disabled={disabled}
            >
              Play Recording
            </button>
            <button
              type="button"
              className={`${styles.controlButton} ${styles.deleteButton}`}
              onClick={deleteRecording}
              disabled={disabled}
            >
              Delete
            </button>
            <button
              type="button"
              className={`${styles.controlButton} ${styles.rerecordButton}`}
              onClick={startRecording}
              disabled={disabled}
            >
              Re-record
            </button>
          </div>
        )}

        {state.status === 'playing' && (
          <button
            type="button"
            className={`${styles.controlButton} ${styles.stopButton}`}
            onClick={() => {
              audioRef.current?.pause()
              if (audioRef.current) audioRef.current.currentTime = 0
              setState(prev => ({ ...prev, status: 'recorded' }))
            }}
          >
            Stop Playback
          </button>
        )}
      </div>
    </div>
  )
}