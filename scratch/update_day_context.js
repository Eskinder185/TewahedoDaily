const fs = require('fs');

let code = fs.readFileSync('src/services/dayChurchContext.ts', 'utf8');

// 1. Add ethiopianLabelAmharic and dayTitleAmharic to DayChurchContext
code = code.replace(
  'ethiopianLabel: string\r\n  dayTitle: string',
  'ethiopianLabel: string\r\n  ethiopianLabelAmharic?: string\r\n  dayTitle: string\r\n  dayTitleAmharic?: string'
);
code = code.replace(
  'ethiopianLabel: string\n  dayTitle: string',
  'ethiopianLabel: string\n  ethiopianLabelAmharic?: string\n  dayTitle: string\n  dayTitleAmharic?: string'
);

// Add isOptionalFast to fastingStatus
code = code.replace(
  'isFastFree: boolean\r\n    label: string | null',
  'isFastFree: boolean\r\n    isOptionalFast?: boolean\r\n    label: string | null'
);
code = code.replace(
  'isFastFree: boolean\n    label: string | null',
  'isFastFree: boolean\n    isOptionalFast?: boolean\n    label: string | null'
);

// 2. Fix ethiopianLabel duplication
code = code.replace(
  "const ethiopianLabel = `${formatEthiopianLong(eth)} E.C.`",
  "const ethiopianLabel = formatEthiopianDate(eth, 'en')\r\n  const ethiopianLabelAmharic = formatEthiopianDate(eth, 'am')"
);
code = code.replace(
  "const ethiopianLabel = `${formatEthiopianLong(eth)} E.C.`",
  "const ethiopianLabel = formatEthiopianDate(eth, 'en')\n  const ethiopianLabelAmharic = formatEthiopianDate(eth, 'am')"
);

// 3. Fix dayTitle to include Kidane Mihret / monthly commemoration clearly
const dayTitleTarget = `  const dayTitle = orthodox.primaryObservance
    ? orthodox.primaryObservance.title
    : orthodox.monthlyCommemorations.length
      ? orthodox.monthlyCommemorations.map((m) => m.title).join(', ')
      : orthodox.season
        ? orthodox.season.title
        : 'A day of prayer'`;

const dayTitleReplacement = `  const dayTitle = orthodox.primaryObservance
    ? orthodox.primaryObservance.title
    : orthodox.monthlyCommemorations.length
      ? \`Monthly Commemoration: \${orthodox.monthlyCommemorations[0].title}\`
      : orthodox.season
        ? orthodox.season.title
        : 'A day of prayer'

  const dayTitleAmharic = orthodox.primaryObservance
    ? orthodox.primaryObservance.titleAmharic
    : orthodox.monthlyCommemorations.length
      ? \`የወር መታሰቢያ: \${orthodox.monthlyCommemorations[0].titleAmharic || orthodox.monthlyCommemorations[0].title}\`
      : orthodox.season
        ? orthodox.season.titleAmharic
        : 'የጸሎት ቀን'`;

code = code.replace(dayTitleTarget.replace(/\n/g, '\r\n'), dayTitleReplacement.replace(/\n/g, '\r\n'));
if (!code.includes('dayTitleAmharic =')) {
  code = code.replace(dayTitleTarget, dayTitleReplacement);
}

// 4. Fix buildLiturgySummary
const litTarget = `      anaphoraTitle: anaphoraSection?.title || null,
      anaphoraSummary: anaphoraSection
        ? \`See \${anaphoraSection.title} in the Divine Liturgy collection.\`
        : 'Standard anaphora is used for this day.',`;

const litReplacement = `      anaphoraTitle: primary?.isMajor ? anaphoraSection?.title || null : null,
      anaphoraSummary: primary?.isMajor && anaphoraSection
        ? \`Canonical anaphora designated for this feast in the Divine Liturgy.\`
        : 'The Divine Liturgy (ስርዓተ ቅዳሴ) of the Ethiopian Orthodox Tewahedo Church.',`;

code = code.replace(litTarget.replace(/\n/g, '\r\n'), litReplacement.replace(/\n/g, '\r\n'));
if (!code.includes('The Divine Liturgy (ስርዓተ ቅዳሴ)')) {
  code = code.replace(litTarget, litReplacement);
}

// 5. Return ethiopianLabelAmharic and dayTitleAmharic
code = code.replace(
  'ethiopianLabel,\r\n    dayTitle,',
  'ethiopianLabel,\r\n    ethiopianLabelAmharic,\r\n    dayTitle,\r\n    dayTitleAmharic,'
);
code = code.replace(
  'ethiopianLabel,\n    dayTitle,',
  'ethiopianLabel,\n    ethiopianLabelAmharic,\n    dayTitle,\n    dayTitleAmharic,'
);

fs.writeFileSync('src/services/dayChurchContext.ts', code, 'utf8');
console.log('dayChurchContext.ts updated successfully');
