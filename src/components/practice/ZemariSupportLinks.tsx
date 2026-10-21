import { useTranslation } from '../../i18n'
import {
  getValidZemariSocialLinks,
  type ZemariSocialLinks,
  type ZemariSocialPlatform,
} from '../../lib/publicContent/zemariSocialLinks'
import styles from './ZemariSupportLinks.module.css'

const PLATFORM_NAMES: Record<ZemariSocialPlatform, string> = {
  instagram: 'Instagram',
  facebook: 'Facebook',
  youtube: 'YouTube',
}

function SocialIcon({ platform }: { platform: ZemariSocialPlatform }) {
  if (platform === 'instagram') {
    return (
      <svg viewBox="0 0 24 24" aria-hidden="true" focusable="false">
        <rect x="3" y="3" width="18" height="18" rx="5" />
        <circle cx="12" cy="12" r="4" />
        <circle cx="17.4" cy="6.6" r="1" className={styles.iconFill} />
      </svg>
    )
  }
  if (platform === 'facebook') {
    return (
      <svg viewBox="0 0 24 24" aria-hidden="true" focusable="false">
        <path d="M14 21v-8h3l.5-3H14V8.2c0-.9.3-1.7 1.8-1.7H18V3.8c-.7-.1-1.6-.2-2.6-.2-2.7 0-4.4 1.6-4.4 4.5V10H8v3h3v8" />
      </svg>
    )
  }
  return (
    <svg viewBox="0 0 24 24" aria-hidden="true" focusable="false">
      <path d="M21 8.2a3 3 0 0 0-2.1-2.1C17 5.6 12 5.6 12 5.6s-5 0-6.9.5A3 3 0 0 0 3 8.2 31 31 0 0 0 2.6 12 31 31 0 0 0 3 15.8a3 3 0 0 0 2.1 2.1c1.9.5 6.9.5 6.9.5s5 0 6.9-.5a3 3 0 0 0 2.1-2.1 31 31 0 0 0 .4-3.8 31 31 0 0 0-.4-3.8Z" />
      <path d="m10 9 5 3-5 3Z" className={styles.iconFill} />
    </svg>
  )
}

export function ZemariSupportLinks({
  singerName,
  links,
}: {
  singerName: string
  links: ZemariSocialLinks
}) {
  const t = useTranslation()
  const validLinks = getValidZemariSocialLinks(links)
  if (!validLinks.length) return null

  return (
    <section className={styles.section} aria-labelledby="zemari-support-title">
      <div className={styles.copy}>
        <h2 id="zemari-support-title">{t('practice.supportSinger.title')}</h2>
        <p>{t('practice.supportSinger.description')}</p>
      </div>
      <div className={styles.links}>
        {validLinks.map(({ platform, url }) => {
          const platformName = PLATFORM_NAMES[platform]
          const label = t('practice.supportSinger.linkLabel', {
            name: singerName,
            platform: platformName,
          })
          return (
            <a
              key={platform}
              href={url}
              target="_blank"
              rel="noopener noreferrer"
              aria-label={`${label} (${t('practice.supportSinger.opensInNewTab')})`}
            >
              <SocialIcon platform={platform} />
              <span>{platformName}</span>
              <span className={styles.srOnly}> ({t('practice.supportSinger.opensInNewTab')})</span>
            </a>
          )
        })}
      </div>
    </section>
  )
}
