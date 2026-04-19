export {}

declare global {
  namespace YT {
    const PlayerState: {
      UNSTARTED: -1
      ENDED: 0
      PLAYING: 1
      PAUSED: 2
      BUFFERING: 3
      CUED: 5
    }

    interface OnStateChangeEvent {
      data: number
      target: Player
    }

    interface OnReadyEvent {
      target: Player
    }

    interface PlayerOptions {
      videoId?: string
      width?: string | number
      height?: string | number
      playerVars?: Record<string, string | number>
      events?: {
        onReady?: (e: OnReadyEvent) => void
        onStateChange?: (e: OnStateChangeEvent) => void
        onError?: (e: { data: number }) => void
      }
    }

    class Player {
      constructor(elementId: string | HTMLElement, options: PlayerOptions)
      destroy(): void
      playVideo(): void
      pauseVideo(): void
      stopVideo(): void
      seekTo(seconds: number, allowSeekAhead?: boolean): void
      getCurrentTime(): number
      getDuration(): number
      setPlaybackRate(suggestedRate: number): void
      getPlaybackRate(): number
      setVolume(volume: number): void
      getVolume(): number
      getPlayerState(): number
    }
  }

  interface Window {
    YT?: {
      Player: typeof YT.Player
      PlayerState: typeof YT.PlayerState
    }
    onYouTubeIframeAPIReady?: () => void
  }
}
