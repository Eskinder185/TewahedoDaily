import { Component, type ErrorInfo, type ReactNode } from 'react'
import { Link } from 'react-router-dom'

type Props = { children: ReactNode }
type State = { message: string | null }

/** Prevents a single CMS chunk failure from blanking the entire SPA. */
export class AdminErrorBoundary extends Component<Props, State> {
  state: State = { message: null }

  static getDerivedStateFromError(error: Error): State {
    return { message: error.message || 'The admin page failed to load.' }
  }

  componentDidCatch(error: Error, info: ErrorInfo) {
    console.error('Admin CMS error', error, info.componentStack)
  }

  render() {
    if (!this.state.message) return this.props.children
    const moduleLoadFailed = /failed to fetch dynamically imported module|error loading dynamically imported module|importing a module script failed|loading chunk .+ failed/i.test(this.state.message)
    return (
      <main style={{ maxWidth: 480, margin: '3rem auto', padding: '1.5rem' }}>
        <h1>Admin unavailable</h1>
        <p role="alert">{this.state.message}</p>
        {moduleLoadFailed && (
          <p>
            This admin page could not be downloaded. Reload it to try again.
            {' '}
            <button type="button" onClick={() => window.location.reload()}>Reload this page</button>
          </p>
        )}
        <p>
          <Link to="/">← Back to Tewahedo Daily</Link>
          {!moduleLoadFailed && (
            <>
              {' · '}
              <Link to="/admin/login" onClick={() => this.setState({ message: null })}>
                Try again
              </Link>
            </>
          )}
        </p>
      </main>
    )
  }
}
