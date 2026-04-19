# Data layer

## JSON bundles (edit these)

| File | Content |
|------|--------|
| `mezmur.json` | Mezmur entries (`type: "mezmur"`) |
| `chants/werb.json` | Werb entries (`type: "werb"`) + `guidedSteps` |
| `tselot/tselot.json` | Tselot entries; use `mode: "gateway"` for major books |
| `tselot/mezmure-dawit/*.json` | Mezmure Dawit (Psalms) chunks |
| `instruments.json` | Kebro, tsenatsil, mequamia guides |
| `shortLessons.json` | Homepage / hero featured clips |
| `todayInChurch.json` | Static commemorations + `seasonByEthMonth` (mock calendar) |

Types live in `src/data/types/`. Loaders: `src/lib/practice/*Data.ts`, `src/data/mocks/churchDay.mock.ts`.

## Swap mock → live

Replace JSON imports with `fetch` + the same shapes, or generate these files in CI from your CMS.
