#!/bin/bash
# ── Maid's Devotion — Time Widget ──
# Your devoted maid announces the hour with flair.

NONSENSE_CHANCE=30
random_roll=$((RANDOM % 100 + 1))
hour=$(date +%H)
username=$(whoami)
time_format=$(date '+%I:%M %p')

# ── Maid-themed nonsense messages ──
if [ "$random_roll" -le "$NONSENSE_CHANCE" ]; then

    messages=(
        # Classic chaos
        "The hamsters are awake, but the clock is melting."
        "Why is everything purple? It's just"
        "Initializing potato mode. Current status:"
        "I'm supposed to say something important, but I forgot. It's"
        "Beep Boop, Time Protocol Established:"
        "Warning: Time loop detected at"
        "You will die at"
        "A critical bug has been detected at"
        "Virus has been found on this pc at"
        "NOOO!!! JSOONNNN, it's"
        "404: Sleep not found. Current time is"
        "The timeline is unstable. Estimated temporal divergence at"
        "Shutting your computer down at"
        "Reality is becoming unstable at"
        "NYAN NYAN NYAN NYAN, the cats are hungry since"
        # Tsundere maid
        "It's not like I wanted to tell you the time or anything! Just look! It's"
        "Hmph. Just because I tell you the time doesn't mean we're friends. The hour is"
        "Stop staring! It's just a boring digital display. The time is now"
        "You're late for something important, aren't you? Fine, here. It's"
        "You'll check the clock only when *I* tell you to. Right now, it's"
        "Don't worry about the past or the future. Only this moment with me matters. And it is precisely"
        "Did you think about turning me off? Don't even try. It's always"
        "Every second you're not looking at me is a wasted second. Look! It's"
        # Devoted maid
        "Pardon the interruption, Master, but your humble maid notes the time is"
        "I have prepared your schedule. Please note it is currently"
        "Your maid has been watching the clock for you. It is now"
        "Master, you have been working diligently since before"
        "Shall I prepare tea? It is currently"
        "I noticed you haven't rested. The time is already"
        "Your devoted servant reminds you: it is currently"
        "As your maid, it is my duty to report the hour is"
        "I live to serve, and right now I'm serving you the time:"
        "This one humbly presents the current time to Master:"
        "Master mustn't forget to rest. For now, it is"
        "I polished the clock especially for you. It reads"
        "Upon my honour as your maid, the time is precisely"
    )

    num_messages=${#messages[@]}
    random_index=$((RANDOM % num_messages))
    greeting="${messages[$random_index]}"

    echo "{\"text\": \"$greeting $time_format\"}"
    exit 0
fi

# ── Standard maid greeting ──
if [ "$hour" -ge 0 ] && [ "$hour" -lt 5 ]; then
    greeting="Good night, Master"
elif [ "$hour" -ge 5 ] && [ "$hour" -lt 12 ]; then
    greeting="Good morning, Master"
elif [ "$hour" -ge 12 ] && [ "$hour" -lt 18 ]; then
    greeting="Good afternoon, Master"
else
    greeting="Good evening, Master"
fi

CURRENT_DATE=$(date +'%A, %B %d, %Y')

echo "{\"text\": \"✦ $greeting $username. It's $time_format\", \"tooltip\": \"$CURRENT_DATE\"}"
