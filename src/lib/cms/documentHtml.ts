/** Render document formatting without executable markup, remote resources, or forms. */
export function sanitizeDocumentHtml(html: string): string {
  const template = document.createElement('template')
  template.innerHTML = html
  const allowed = new Set(['P', 'DIV', 'SPAN', 'BR', 'HR', 'H1', 'H2', 'H3', 'H4', 'H5', 'H6',
    'STRONG', 'B', 'EM', 'I', 'U', 'S', 'SUB', 'SUP', 'BLOCKQUOTE', 'PRE', 'CODE',
    'UL', 'OL', 'LI', 'DL', 'DT', 'DD', 'TABLE', 'THEAD', 'TBODY', 'TFOOT', 'TR', 'TH', 'TD', 'CAPTION', 'A', 'IMG'])
  const discard = new Set(['SCRIPT', 'STYLE', 'IFRAME', 'OBJECT', 'EMBED', 'SVG', 'MATH', 'TEMPLATE',
    'FORM', 'INPUT', 'BUTTON', 'TEXTAREA', 'SELECT', 'LINK', 'META', 'BASE', 'VIDEO', 'AUDIO'])
  for (const element of Array.from(template.content.querySelectorAll('*'))) {
    if (discard.has(element.tagName)) { element.remove(); continue }
    if (!allowed.has(element.tagName)) { element.replaceWith(...element.childNodes); continue }
    if (element.tagName === 'IMG' && !/^data:image\/(?:png|jpeg|gif|webp);base64,[A-Za-z0-9+/=]+$/i.test(element.getAttribute('src') || '')) {
      element.remove(); continue
    }
    for (const attribute of Array.from(element.attributes)) {
      const name = attribute.name.toLowerCase()
      const value = attribute.value
      const safeLink = element.tagName === 'A' && name === 'href' &&
        /^(?:https?:\/\/|mailto:|#[A-Za-z0-9_-])/i.test(value) &&
        !Array.from(value).some((character) => character.charCodeAt(0) <= 32 || character.charCodeAt(0) === 127)
      const safeImage = element.tagName === 'IMG' && (name === 'src' || name === 'alt')
      if (!safeLink && !safeImage && !['lang', 'dir', 'title'].includes(name)) element.removeAttribute(attribute.name)
    }
    if (element.tagName === 'A') element.setAttribute('rel', 'noopener noreferrer')
  }
  return template.innerHTML
}
