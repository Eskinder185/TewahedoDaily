declare global {
  interface Window {
    YT?: {
      Player: new (
        elementId: string | HTMLElement,
        options: {
          videoId?: string
          playerVars?: Record<string, number | string>
          events?: {
            onReady?: (event: YT.PlayerEvent) => void
            onStateChange?: (event: YT.OnStateChangeEvent) => void
            onError?: (event: YT.OnErrorEvent) => void
          }
        },
      ) => YT.Player
      PlayerState: {
        UNSTARTED: number
        ENDED: number
        PLAYING: number
        PAUSED: number
        BUFFERING: number
        CUED: number
      }
    }
    onYouTubeIframeAPIReady?: () => void
  }
}

declare namespace YT {
  interface Player {
    destroy(): void
    getCurrentTime(): number
    getDuration(): number
    getPlayerState(): number
    getVolume(): number
    isMuted(): boolean
    mute(): void
    pauseVideo(): void
    playVideo(): void
    seekTo(seconds: number, allowSeekAhead?: boolean): void
    setPlaybackRate(rate: number): void
    setVolume(volume: number): void
    unMute(): void
  }

  interface PlayerEvent {
    target: Player
  }

  interface OnStateChangeEvent extends PlayerEvent {
    data: number
  }

  interface OnErrorEvent extends PlayerEvent {
    data: number
  }
}

export {}
