export type PracticeTabTarget = 'chants' | 'instruments' | 'prayers'

export type LessonVideoEntry = {
  id: string
  title: string
  /** e.g. "0:45" */
  duration: string
  tag: string
  hook: string
  youtubeUrl: string
  thumbnail?: string
  practiceTab?: PracticeTabTarget
  /** Home hash when not sending users to Practice */
  homeSection?: 'today' | 'lessons'
}
