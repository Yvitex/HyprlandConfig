#!/bin/bash
# ── Maid's Devotion — Rotating Quotes ──
# The sidebar maid whispers words of devoted service.

quotes=(
    "Your humble servant stands ready."
    "It shall be done at once, Master."
    "I exist to serve your every need."
    "Please allow me to assist you."
    "Master's comfort is my purpose."
    "I have prepared everything for you."
    "Your wish is my command, always."
    "Leave the rest to me, Master."
    "I shall not fail you."
    "Your devoted maid awaits."
    "Nothing shall trouble you today."
    "Allow me to handle that for you."
    "I am always watching over you."
    "Your wellbeing is my priority."
    "Consider it done, Master."
    "I live to be of service."
    "You may rely on me completely."
    "Every detail is attended to."
    "Rest easy. I am here."
    "Your satisfaction is my reward."
)

num=${#quotes[@]}
idx=$((RANDOM % num))
text="${quotes[$idx]}"

echo "{\"text\": \"$text\", \"tooltip\": \"${quotes[$((RANDOM % num))]}\"}"
