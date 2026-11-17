/**
 * LOCAL-ONLY Faith Challenges preview switch.
 *
 * `import.meta.env.DEV` is replaced by the literal `false` in every production build (including Cloudflare Pages previews),
 * so `LOCAL_PREVIEW` is a compile-time `false` there and everything behind it (the review screen, banner and write guard
 * installation) is removed from the bundle. It is true only when the Vite DEV server is started with VITE_LOCAL_PREVIEW=true,
 * which `npm run preview:local` does. Nothing in production reads this flag as `true`.
 */
// `typeof import.meta.env` keeps this safe when the module is imported by Node test scripts (plain tsx has no Vite `env` object): it is false
// there, and Vite replaces `import.meta.env` with an object literal in the browser, so the check is a constant in every real build.
export const LOCAL_PREVIEW: boolean = typeof import.meta.env !== 'undefined' && import.meta.env.DEV === true && import.meta.env.VITE_LOCAL_PREVIEW === 'true'
