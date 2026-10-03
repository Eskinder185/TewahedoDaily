# -*- coding: utf-8 -*-
from pathlib import Path
import re

p = Path('src/lib/i18n/uiLabels.ts')
t = p.read_text(encoding='utf-8')
day_title = '\u12c8\u12f0 \u1240\u1295 \u1308\u133d\u1273 \u1240\u12ed\u122d'
night_title = '\u12c8\u12f0 \u120c\u120a\u1275 \u1308\u133d\u1273 \u1240\u12ed\u122d'
day_label = '\u1240\u1295'
night_label = '\u120c\u120a\u1275'
t2 = re.sub(
    r"themeDayLabel: \{ en: 'Day', am: '[^']*' \}",
    f"themeDayLabel: {{ en: 'Day', am: '{day_label}' }}",
    t,
)
t2 = re.sub(
    r"themeNightLabel: \{ en: 'Night', am: '[^']*' \}",
    f"themeNightLabel: {{ en: 'Night', am: '{night_label}' }}",
    t2,
)
t2 = re.sub(
    r"themeDayTitle: \{ en: 'Switch to Day theme', am: '[^']*' \}",
    f"themeDayTitle: {{ en: 'Switch to Day theme', am: '{day_title}' }}",
    t2,
)
t2 = re.sub(
    r"themeNightTitle: \{ en: 'Switch to Night theme', am: '[^']*' \}",
    f"themeNightTitle: {{ en: 'Switch to Night theme', am: '{night_title}' }}",
    t2,
)
assert t2 != t, 'no change'
p.write_text(t2, encoding='utf-8')
print('fixed')
