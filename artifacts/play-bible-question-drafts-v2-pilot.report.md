# Bible Question Bank v2: Comprehension Pilot QA

Status: draft only. Nothing was published or imported. Source: `artifacts/play-bible-snapshot-1793487606836.json` (WEB edition).

## Summary

- Candidates reviewed: 17
- Accepted: 10
- Rejected: 7
- Distinct chapters: 10
- By book: Genesis 3, Exodus 3, Matthew 2, John 2
- Correct-answer position: a=3, b=2, c=3, d=2
- Questions where the correct option is the longest: 6 of 10

## Automated checks (all passed)

- Every cited verse range exists in the snapshot and is complete.
- Every evidence quote below is an exact substring of the cited range.
- Each question has four unique options (keys a to d) and one valid correctKey.
- No blanks in prompts; longest option is at most 1.45 times the shortest.
- IDs and chapters are unique; no ID or prompt matches the 50 rejected drafts.

## Needs human review

- A person has not reviewed these. `verifiedLocales: ["en"]` follows the existing field format and is not an editorial sign-off.
- That distractors are false within the cited passage was judged by reading it, not by an automated check.
- John 9 and Exodus 20 touch doctrine, so they should get pastoral or editorial review.
- The WEB uses "Yahweh" and "ship". Existing app content should be compared for preferred naming before import.

## Accepted

| ID | Passage | Domain | Difficulty | Longest phrase shared with passage: prompt / answer (words) |
|---|---|---|---|---|
| bible-v2-genesis-8-bird-sequence | Genesis 8:6–12 | chronology | challenge | 2 / 3 |
| bible-v2-genesis-13-separation-reason | Genesis 13:5–9 | people | growing | 1 / 2 |
| bible-v2-genesis-45-joseph-purpose | Genesis 45:5–8 | people | growing | 1 / 3 |
| bible-v2-exodus-12-blood-token | Exodus 12:12–13 | events | beginner | 3 / 2 |
| bible-v2-exodus-18-shared-judging | Exodus 18:17–23 | people | growing | 4 / 3 |
| bible-v2-exodus-20-sabbath-reason | Exodus 20:8–11 | commandment | growing | 3 / 5 |
| bible-v2-matthew-13-thorns-meaning | Matthew 13:18–23 | teaching | growing | 5 / 2 |
| bible-v2-matthew-18-unforgiving-servant | Matthew 18:23–35 | teaching | challenge | 3 / 2 |
| bible-v2-john-4-worship-place | John 4:19–21 | location | growing | 1 / 4 |
| bible-v2-john-9-blindness-cause | John 9:1–3 | teaching | growing | 3 / 4 |

## Evidence

### Genesis 8:6–12

Which order matches how Noah tested whether the waters had gone down?

Answer: Raven, dove that returned, dove with an olive leaf, dove that stayed away

- "he sent forth a raven"
- "she returned to him into the ship"
- "in her mouth was an olive leaf"
- "she didn't return to him any more"

### Genesis 13:5–9

Why did Abram propose that he and Lot separate?

Answer: The land could not support both households, and their herdsmen were in conflict

- "The land was not able to bear them"
- "There was a strife between the herdsmen"
- "let there be no strife between me and you"
- "Please separate yourself from me"

### Genesis 45:5–8

When Joseph revealed himself, what purpose did he tell his brothers lay behind his being in Egypt?

Answer: God had sent him ahead of them to preserve life through the famine

- "God sent me before you to preserve life"
- "So now it wasn't you who sent me here, but God"

### Exodus 12:12–13

What did Yahweh say the blood on the houses would do on the night He struck Egypt?

Answer: Serve as a token, so He would pass over and no plague would destroy them

- "The blood shall be to you for a token on the houses"
- "when I see the blood, I will pass over you"
- "there shall no plague be on you to destroy you"

### Exodus 18:17–23

What change did Moses’ father-in-law counsel so that Moses would not wear himself out?

Answer: Appoint able men to judge small matters and bring the great matters to Moses

- "You will surely wear away"
- "you shall provide out of all the people able men"
- "every great matter they shall bring to you, but every small matter they shall judge themselves"
- "they shall share the load with you"

### Exodus 20:8–11

What reason does the Sabbath commandment in Exodus 20 itself give for keeping the seventh day holy?

Answer: Yahweh made heaven and earth in six days and rested on the seventh

- "for in six days Yahweh made heaven and earth"
- "rested the seventh day"
- "therefore Yahweh blessed the Sabbath day, and made it holy"

### Matthew 13:18–23

In Jesus’ explanation of the parable of the farmer, what do the thorns represent?

Answer: Worldly worries and the false appeal of wealth crowding out the word

- "What was sown among the thorns"
- "the cares of this age and the deceitfulness of riches choke the word"

### Matthew 18:23–35

In the parable of the king settling accounts, why was the first servant finally handed to the tormentors?

Answer: He showed no mercy to a fellow servant after his own debt was forgiven

- "released him, and forgave him the debt"
- "He would not, but went and cast him into prison"
- "Shouldn't you also have had mercy on your fellow servant"
- "delivered him to the tormentors"

### John 4:19–21

What disagreement about worship did the Samaritan woman raise with Jesus?

Answer: Whether people ought to worship on her people’s mountain or in Jerusalem

- "Our fathers worshiped in this mountain"
- "you Jews say that in Jerusalem is the place where people ought to worship"

### John 9:1–3

When the disciples asked who had sinned, how did Jesus explain why the man was born blind?

Answer: Neither he nor his parents had sinned; God’s works would be revealed in him

- "who sinned, this man or his parents"
- "Neither did this man sin, nor his parents"
- "that the works of God might be revealed in him"

## Rejected

| Passage | Idea | Reason |
|---|---|---|
| Genesis 22:9–14 | What did Abraham offer in place of Isaac? | Recognition recall: the ram is widely known, and same-domain distractors would not test understanding. |
| Exodus 16:22–30 | Why did Israel gather a double portion on the sixth day? | Duplicate theme: overlaps the accepted Sabbath question from Exodus 20. |
| Matthew 4:1–11 | What was the order of the three temptations? | Insufficient source: the order differs in Luke 4, which is not in this snapshot, so the answer could not be checked for harmony. |
| John 5:2–9 | What were the sick waiting for at Bethesda? | Edition risk: the answer rests on John 5:4, a verse many Bible editions omit or footnote. |
| John 11:1–6 | Why did Jesus stay two days after hearing Lazarus was sick? | Ambiguous: the passage gives no explicit reason for the delay, so any answer would be an inference. |
| John 13:3–15 | Why did Jesus wash the disciples’ feet? | Ambiguous: verses 8 and 15 support different valid answers (having part with Him; giving an example). |
| John 21:15–19 | What death did Jesus foretell for Peter? | Insufficient evidence: verse 19 says "what kind of death" but the passage never names it. |
