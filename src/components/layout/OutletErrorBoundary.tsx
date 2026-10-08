import { Component, type ErrorInfo, type ReactNode } from 'react'
import { Link } from 'react-router-dom'
import styles from './OutletErrorBoundary.module.css'

type Props = { children: ReactNode }
type State = { message: string | null; chunkFailure: boolean }

function isChunkLoadError(error: Error): boolean {
  const text = `${error.name} ${error.message}`
  return /Failed to fetch dynamically imported module|Loading chunk|Importing a module script failed|error loading dynamically imported module/i.test(
    text,
  )
}

/**
 * Keeps AppShell chrome (header/footer/Search Buddy) when a lazy route or
 * offline chunk load fails. Full-router errorElement would replace the shell.
 */
export class OutletErrorBoundary extends Component<Props, State> {
  state: State = { message: null, chunkFailure: false }

  static getDerivedStateFromError(error: Error): State {
    return {
      message: error.message || 'This page failed to load.',
      chunkFailure: isChunkLoadError(error),
    }
  }

  componentDidCatch(error: Error, info: ErrorInfo) {
    console.error('Route render error', error, info.componentStack)
  }

  private retry = () => {
    if (this.state.chunkFailure) {
      window.location.reload()
      return
    }
    this.setState({ message: null, chunkFailure: false })
  }

  render() {
    if (!this.state.message) return this.props.children

    return (
      <div className={styles.root} role="alert">
        <h1 className={styles.title}>
          {this.state.chunkFailure ? 'Connection interrupted' : 'Page unavailable'}
        </h1>
        <p className={styles.copy}>
          {this.state.chunkFailure
            ? 'A page script could not be loaded. Check your connection, then try again.'
            : 'Something went wrong while opening this page. Your place in the site is still here.'}
        </p>
        {import.meta.env.DEV ? <p className={styles.detail}>{this.state.message}</p> : null}
        <div className={styles.actions}>
          <button type="button" className={styles.primary} onClick={this.retry}>
            {this.state.chunkFailure ? 'Reload page' : 'Try again'}
          </button>
          <Link className={styles.secondary} to="/" onClick={() => this.setState({ message: null, chunkFailure: false })}>
            Go home
          </Link>
        </div>
      </div>
    )
  }
}
