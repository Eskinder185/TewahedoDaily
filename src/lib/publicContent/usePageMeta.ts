import { useEffect } from 'react'
export function usePageMeta(
  title: string,
  description: string,
  image?: string,
  canonical?: string,
) {
  useEffect(() => {
    const previous = document.title
    document.title = `${title} | Tewahedo Daily`
    const cleanups: (() => void)[] = []
    for (const [name, value] of [
      ['description', description],
      ['og:title', title],
      ['og:description', description],
      ['og:type', 'article'],
      ['og:url', canonical || window.location.href.split('?')[0]],
      ['og:image', image || ''],
    ]) {
      const attribute = name.startsWith('og:') ? 'property' : 'name'
      let element = document.head.querySelector<HTMLMetaElement>(
        `meta[${attribute}="${name}"]`,
      )
      const old = element?.content
      if (!element) {
        element = document.createElement('meta')
        element.setAttribute(attribute, name)
        document.head.appendChild(element)
      }
      element.content = value
      const target = element
      cleanups.push(() => {
        if (old === undefined) target.remove()
        else target.content = old
      })
    }
    const existing = document.head.querySelector<HTMLLinkElement>(
      'link[rel="canonical"]',
    )
    const oldHref = existing?.href
    const link = existing || document.createElement('link')
    link.rel = 'canonical'
    link.href = canonical || window.location.href.split('?')[0]
    if (!existing) document.head.appendChild(link)
    return () => {
      document.title = previous
      cleanups.forEach((fn) => fn())
      if (oldHref) link.href = oldHref
      else link.remove()
    }
  }, [title, description, image, canonical])
}
