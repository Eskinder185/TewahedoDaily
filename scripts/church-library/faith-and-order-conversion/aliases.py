"""Controlled search vocabulary for The Faith And Order Of The Church.

Every entry is DERIVED SEARCH METADATA. None of the Amharic or transliterated
strings occur in the English source document; they exist only so that
questions asked in Amharic or transliteration can reach the English passages.

Each topic has:
  triggers  - English regexes; a passage receives the topic only when its own
              chapter/section title or content matches (case-insensitive).
  keywords  - English search keywords attached to matching passages.
  aliases   - Amharic / Ge'ez-script and transliterated aliases.
  expansion - English terms the database query expander adds when a visitor's
              query contains one of the aliases (see the proposed migration).
  note      - theological ambiguity reviewed for this alias set.
"""

TOPICS = [
    {
        "topic": "holy_trinity",
        "triggers": [r"\btrinity\b", r"\bgodhead\b", r"three persons", r"\bone in three\b"],
        "keywords": ["Holy Trinity", "Trinity", "Godhead", "Father", "Son", "Holy Spirit", "unity of God", "three Persons"],
        "aliases": ["ቅድስት ሥላሴ", "ሥላሴ", "ምሥጢረ ሥላሴ", "አንድነትና ሦስትነት", "Kidist Selassie", "Selassie", "Sillase", "Mistire Sillase"],
        "expansion": ["trinity", "godhead", "three persons"],
        "note": "ሥላሴ is the standard EOTC term for the Holy Trinity. 'Selassie' also appears in personal names; aliases are attached only to passages that discuss the Trinity.",
    },
    {
        "topic": "godhead_persons",
        "triggers": [r"\bmelekote\b", r"\bakal\b"],
        "keywords": ["Godhead", "Persons", "Melekote", "Akal"],
        "aliases": ["መለኮት", "አካል", "Melekot", "Akal"],
        "expansion": ["godhead", "persons"],
        "note": "The source itself transliterates these as 'Melekote' and 'Akal'; the Ethiopic spellings are added as aliases only.",
    },
    {
        "topic": "incarnation",
        "triggers": [r"\bincarnat", r"\bwas made man\b", r"\bmanhood\b"],
        "keywords": ["Incarnation", "God the Son", "Jesus Christ", "Virgin Mary", "manhood", "Godhead"],
        "aliases": ["ሥጋዌ", "ምሥጢረ ሥጋዌ", "Sigawe", "Mistire Sigawe"],
        "expansion": ["incarnation", "incarnate"],
        "note": "Transliteration 'Sigawe' (ሥጋዌ, Incarnation) can be confused with ሥጋውና ደሙ ('His Body and Blood', Holy Communion). The communion alias set deliberately uses 'Sigawna Demu', not 'Sigawe'.",
    },
    {
        "topic": "tewahedo_christology",
        "triggers": [r"one incarnate nature", r"two natures", r"chalcedon", r"without mixture", r"without division or confusion", r"indivisibl"],
        "keywords": ["one incarnate nature", "union of Godhead and manhood", "Chalcedon", "Oriental Orthodox", "Christology"],
        "aliases": ["ተዋሕዶ", "Tewahedo", "Tewahido", "ኬልቄዶን", "Kelkedon"],
        "expansion": ["one incarnate nature", "two natures", "chalcedonian", "union"],
        "note": "Tewahedo ('made one, united') names the union of Godhead and manhood in the one Christ; attached only to passages on that union, not to every passage of the book.",
    },
    {
        "topic": "virgin_mary",
        "triggers": [r"\bvirgin\b", r"\bmary\b"],
        "keywords": ["Virgin Mary", "Our Lady Mary"],
        "aliases": ["ቅድስት ድንግል ማርያም", "ድንግል ማርያም", "እመቤታችን", "Dingil Maryam", "Emebetachin"],
        "expansion": ["virgin", "mary"],
        "note": "",
    },
    {
        "topic": "baptism",
        "triggers": [r"\bbaptis", r"\bbaptiz"],
        "keywords": ["Baptism", "baptize", "rebirth", "regeneration", "water and the Spirit"],
        "aliases": ["ጥምቀት", "ምሥጢረ ጥምቀት", "Timket", "Timkat", "Temqet", "Mistire Timket"],
        "expansion": ["baptism", "baptize", "baptized"],
        "note": "ጥምቀት/Timket also names the Epiphany feast (Ṭərr 11). These aliases point to passages on the sacrament/mystery of Baptism; Epiphany questions should be answered from calendar content, not from these passages.",
    },
    {
        "topic": "infant_baptism",
        "triggers": [r"\binfants?\b", r"\bbabies\b", r"40 days", r"80 days"],
        "keywords": ["infant baptism", "40 days", "80 days", "children"],
        "aliases": ["የሕፃናት ጥምቀት", "ክርስትና", "Kristinna", "Christening"],
        "expansion": ["infants", "babies", "baptism"],
        "note": "ክርስትና (Kristinna) is the common Amharic word for christening/baptism of a child.",
    },
    {
        "topic": "holy_communion",
        "triggers": [r"holy communion", r"\beucharist", r"lord.s table", r"flesh and blood", r"body and blood", r"bread and wine"],
        "keywords": ["Holy Communion", "Eucharist", "Body and Blood of Christ", "bread and wine", "Lord's Table"],
        "aliases": ["ቁርባን", "ቅዱስ ቁርባን", "ምሥጢረ ቁርባን", "ሥጋውና ደሙ", "Qurban", "Kurban", "Kidus Qurban", "Sigawna Demu"],
        "expansion": ["holy communion", "eucharist", "body and blood", "bread and wine"],
        "note": "ቁርባን literally 'offering'; in EOTC usage it names Holy Communion. Kept distinct from ሥጋዌ (Incarnation).",
    },
    {
        "topic": "liturgy_anaphora",
        "triggers": [r"\banaphora\b", r"\bliturgy\b"],
        "keywords": ["Anaphora", "Liturgy", "Divine Liturgy"],
        "aliases": ["ቅዳሴ", "Qidase", "Kidase"],
        "expansion": ["anaphora", "liturgy"],
        "note": "ቅዳሴ is the EOTC Divine Liturgy; the source's 'Anaphora of St. John' etc. are individual ቅዳሴ texts.",
    },
    {
        "topic": "resurrection",
        "triggers": [r"\bresurrection\b", r"\brose from the dead\b", r"\braised\b", r"\brisen\b"],
        "keywords": ["Resurrection", "resurrection of the dead", "eternal life", "last day"],
        "aliases": ["ትንሣኤ", "ትንሣኤ ሙታን", "ምሥጢረ ትንሣኤ ሙታን", "Tinsae", "Tensae", "Tinsae Mutan"],
        "expansion": ["resurrection", "raised", "risen"],
        "note": "ትንሣኤ also names the Easter feast. The source chapter concerns the resurrection of the dead (ትንሣኤ ሙታን) and Christ's resurrection.",
    },
    {
        "topic": "salvation",
        "triggers": [r"\bsalvation\b", r"\bsave[ds]?\b", r"\bredempt", r"\bredeem"],
        "keywords": ["salvation", "redemption", "saving work of God"],
        "aliases": ["ድኅነት", "መዳን", "ቤዛነት", "Dihnet", "Medan", "Bezanet"],
        "expansion": ["salvation", "redemption", "saved"],
        "note": "ድኅነት (salvation) and ቤዛነት (redemption/ransom) are close but not identical; both are attached only where the passage itself speaks of salvation or redemption.",
    },
    {
        "topic": "repentance_penance",
        "triggers": [r"\bpenance\b", r"\brepent", r"\bconfession\b", r"\bconfess\b", r"\babsolution\b"],
        "keywords": ["Penance", "Repentance", "Confession", "absolution", "remission of sins"],
        "aliases": ["ንስሐ", "ምሥጢረ ንስሐ", "ኑዛዜ", "የንስሐ አባት", "Nisiha", "Nissiha", "Niseha", "Nuzaze", "Yenisiha Abat"],
        "expansion": ["penance", "repentance", "confession", "absolution"],
        "note": "ንስሐ covers both repentance (the inner turning) and the sacrament of Penance; the English source uses both words. 'Confess' in the sense of confessing faith also triggers this topic, so reviewers should spot-check.",
    },
    {
        "topic": "confirmation",
        "triggers": [r"\bconfirmation\b", r"\bholy oil\b", r"\bchrism", r"\bmyron\b", r"\banoint"],
        "keywords": ["Confirmation", "anointing", "holy oil", "gift of the Holy Spirit"],
        "aliases": ["ሜሮን", "ቅብዐ ሜሮን", "ምሥጢረ ሜሮን", "Meron", "Qibe Meron"],
        "expansion": ["confirmation", "anointing", "anoint"],
        "note": "EOTC Confirmation is administered with holy Myron (ሜሮን) immediately after baptism; 'anoint' also matches the Unction and anointing-of-kings passages, which is acceptable for retrieval.",
    },
    {
        "topic": "unction",
        "triggers": [r"\bunction\b", r"\bfunction of the sick\b", r"anoints the body of the sick", r"\bthe sick\b"],
        "keywords": ["Unction of the Sick", "anointing of the sick", "healing"],
        "aliases": ["ቀንዲል", "ምሥጢረ ቀንዲል", "Qendil", "Kendil", "Kandil"],
        "expansion": ["unction", "sick", "anointing"],
        "note": "The source text writes 'function of the sick' in two places (an evident typo for 'unction'); the trigger matches both spellings without altering the text.",
    },
    {
        "topic": "matrimony",
        "triggers": [r"\bmatrimon", r"\bmarriage\b", r"\bhusband\b", r"\bwife\b"],
        "keywords": ["Matrimony", "Marriage", "husband and wife"],
        "aliases": ["ተክሊል", "ምሥጢረ ተክሊል", "ጋብቻ", "Teklil", "Gabicha"],
        "expansion": ["matrimony", "marriage"],
        "note": "ተክሊል is the church crowning rite of marriage; ጋብቻ is marriage in general.",
    },
    {
        "topic": "holy_orders",
        "triggers": [r"holy orders", r"\bordination\b", r"\bclergy\b", r"\bbishops?\b", r"\bpriesthood\b", r"\bdeacons?\b"],
        "keywords": ["Holy Orders", "priesthood", "ordination", "bishop", "priest", "deacon", "clergy"],
        "aliases": ["ክህነት", "ምሥጢረ ክህነት", "ጳጳስ", "ኤጲስ ቆጶስ", "ካህን", "ቄስ", "ዲያቆን", "Kihnet", "Kehnet", "Papas", "Episkopos", "Kahin", "Qes", "Diyakon"],
        "expansion": ["holy orders", "priest", "bishop", "deacon", "ordination"],
        "note": "",
    },
    {
        "topic": "seven_sacraments",
        "triggers": [r"seven sacraments", r"church sacraments?", r"number of church sacraments", r"\bsacraments are seven\b"],
        "keywords": ["seven sacraments", "Church sacraments", "sacrament", "invisible grace"],
        "aliases": ["ሰባቱ ምሥጢራት", "ምሥጢራተ ቤተ ክርስቲያን", "ሰባቱ ምሥጢራተ ቤተ ክርስቲያን", "Sebatu Mistirat", "Mistirate Bete Kristiyan"],
        "expansion": ["sacraments", "seven"],
        "note": "Kept separate from the Five Pillars of Mystery (አምስቱ አዕማደ ምሥጢራት). Baptism and Communion appear in both lists, but the lists are distinct and aliases must not merge them.",
    },
    {
        "topic": "five_pillars_of_mystery",
        "triggers": [],  # assigned by chapter, see build script
        "keywords": ["mysteries of faith"],
        "aliases": ["አምስቱ አዕማደ ምሥጢራት", "አዕማደ ምሥጢራት", "Amistu Aimade Mistirat", "Aimade Mistirat"],
        "expansion": ["mystery"],
        "note": "Derived: the book's five 'THE MYSTERY OF …' chapters (Trinity, Incarnation, Baptism, Holy Communion, Resurrection) correspond to the EOTC Five Pillars of Mystery. The source does not use that phrase; the alias is attached only to those five chapters, never to the seven-sacrament chapters.",
    },
    {
        "topic": "sin",
        "triggers": [r"\bsins?\b", r"\bsinful\b", r"\bsinners?\b"],
        "keywords": ["sin", "remission of sins", "forgiveness"],
        "aliases": ["ኃጢአት", "ስርየተ ኃጢአት", "Hatiat", "Siryete Hatiat"],
        "expansion": ["sin", "sins", "remission"],
        "note": "",
    },
]

# Chapters whose (normalized) title starts with "The Mystery of".
FIVE_PILLAR_CHAPTER_PATTERN = r"^The Mystery of "
