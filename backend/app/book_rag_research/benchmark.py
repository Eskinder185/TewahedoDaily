"""Provisional source-linked questions, explicitly awaiting human gold review."""
from __future__ import annotations

EXAMPLES = [
    "At what time was Jesus Christ baptized?",
    "Why did Jesus choose to be baptized in the Jordan River?",
    "What are the Five Mysteries?",
    "ሰላም፣ ስምህ ማን ነው?",
    "ኢየሱስ ክርስቶስ ለምን ተጠመቀ?",
    "አምስቱ ምሥጢራት ምንድን ናቸው?",
]


def provisional_questions():
    paired = [
        ("jordan", "Why was Christ baptized in the Jordan, according to the Matthew Andemta?",
         "በማቴዎስ አንድምታ መሠረት ክርስቶስ ለምን በዮርዳኖስ ተጠመቀ?", ["M01-P0476"]),
        ("baptism_grace", "Was Christ baptized to gain grace, or to sanctify the waters?",
         "ክርስቶስ ጸጋ ለማግኘት ነው የተጠመቀው ወይስ ውኃን ለመቀደስ?", ["M01-P0492"]),
        ("myron", "Why is Myron called a seal, and what does it confirm?",
         "ማይሮን ለምን ማኅተም ተባለ? ምንንስ ያጸናል?", ["S01-P0208"]),
        ("sacraments", "Name the seven sacraments of the Church.",
         "ሰባቱ የቤተ ክርስቲያን ምሥጢራት ምንድን ናቸው?", [f"S01-P{i:04}" for i in range(53,60)]),
        ("selama", "Why was Frumentius called Kesate Birhan and Abba Selama?",
         "ፍሬምናጦስ ለምን ከሣቴ ብርሃን እና አባ ሰላማ ተባለ?", ["E01-P0200"]),
        ("nine_saints", "Which language preparation did the Nine Saints undertake at Aksum before preaching?",
         "ዘጠኙ ቅዱሳን ወንጌልን ከመስበካቸው በፊት በአክሱም ስለ ቋንቋ ምን ተማሩ?", ["E01-P0243"]),
        ("nicaea", "Where and in which year does World Church History place Constantine's council?",
         "የዓለም ቤተ ክርስቲያን ታሪክ የቆስጠንጢኖስን ጉባኤ የት እና በስንት ዓመት ያስቀምጣል?", ["W01-P0365"]),
        ("monastic", "Who is described as the first hermit, and who organized monastic life after him?",
         "የመጀመሪያው ባሕታዊ ማን ነው? የገዳም ሕይወትንስ በሕግና በሥርዓት ያስፋፋው ማን ነው?", ["W01-P0453"]),
        ("matthew_ref", "What does the Andemta's Matthew 3:13 passage say about Jesus coming to John?",
         "የማቴዎስ 3፥13 አንድምታ ኢየሱስ ወደ ዮሐንስ ስለ መምጣቱ ምን ይላል?", ["M01-P0474"]),
    ]
    cases=[]
    for topic,en,am,gold in paired:
        for query_lang,q in (("en",en),("am",am)):
            for target in ("en","am"):
                cases.append(dict(id=f"{topic}_{query_lang}_{target}",topic=topic,question=q,
                                  query_language=query_lang,target_language=target,relevant_paragraph_ids=gold))
    for topic,en,am,gold in [
        ("trinity", "How is one God understood in relation to the three Persons?", "አንድ አምላክ በሦስት አካላት እንዴት ይታወቃል?", ["F01W-P0014"]),
        ("incarnation", "What is the purpose of the Incarnation in Faith and Order?", "በእምነትና ሥርዓት መጽሐፍ መሠረት የሥጋዌ ዓላማ ምንድን ነው?", ["F01W-P0040"]),
        ("resurrection", "What does Faith and Order say about resurrection to life and judgment?", "ስለ ሕይወት እና ስለ ፍርድ ትንሣኤ የእምነትና ሥርዓት መጽሐፍ ምን ይላል?", ["F01W-P0107"]),
    ]:
        for lang,q in (("en",en),("am",am)):
            cases.append(dict(id=f"{topic}_{lang}_en",topic=topic,question=q,query_language=lang,
                              target_language="en",relevant_paragraph_ids=gold))
    cases.append(dict(id="mixed_myron_en",topic="mixed_terms",question="Why is ማይሮን called a seal of Baptism?",
                      query_language="mixed",target_language="en",relevant_paragraph_ids=["S01-P0208"]))
    for c in cases:
        c.update(human_reviewed=False,reviewer=None,label_status="provisional_agent_source_linked",
                 reference_policy="Source relevance only; not theological approval. F01 is the user-designated comparison reference.")
    return cases
