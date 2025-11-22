#!/bin/bash

# --- Configuration ---
# Set the probability (e.g., 10 means 1 in 10 chance, or 10%)
NONSENSE_CHANCE=30

# Get a random number between 1 and 100
random_roll=$((RANDOM % 100 + 1))

# Get the current hour in 24-hour format
hour=$(date +%H)

# Get the current username
username=$(whoami)

# Get the time in 12-hour format with AM/PM
time_format=$(date '+%I:%M %p')

# --- Random Nonsense Section ---

# Check if the random roll is less than or equal to the chance threshold (10%)
if [ "$random_roll" -le "$NONSENSE_CHANCE" ]; then
    
    # List of random messages
    messages=(
        "The hamsters are awake, but the clock is melting."
        "Why is everything purple? It's just"
        "Initializing potato mode. Current status:"
        "I'm supposed to say something important, but I forgot. It's"
        "Beep Boop, Time Protocol Established:"
        "Have you checked under your keyboard? It's"
        "Warning: Time loop detected at"
        "You will die at"
        "A critical bug has been detected at"
        "Virus has been found on this pc at"
        "NOOO!!! JSOONNNN, it's"
        "That hot chick CPU says its"
        "Did you remember to feed the digital fish? It's"
        "404: Sleep not found. Current time is"
        "The timeline is unstable. Estimated temporal divergence at"
        "Shhh... I hear code whispering. It's"
        "GREETING_MESSAGE_UNDEFINED. Displaying random string:"
        "My CPU needs a hug. It is currently"
        "We interrupt this broadcast for a lack of signal. It's"
        "Current energy level: Low Battery. The hour is"
        "Please stand by for system recalibration. Time is"
        "The squirrels outside are judging your workflow. It's"
        "Shutting your computer down at"
        "Reality is becoming unstable, time to destroy this dimension before"
        "NYAN NYAN NYAN NYAN, the cats are hungry since"
        "It's not like I wanted to tell you the time or anything! Just look! It's"
        "Hmph. Just because I tell you the time doesn't mean we're friends. The hour is"
        "Stop staring! It's just a boring digital display. The time is now"
        "You're late for something important, aren't you? Fine, here. It's"
        "You'll check the clock only when *I* tell you to. Right now, it's"
        "Don't worry about the past or the future. Only this moment with me matters. And it is precisely"
        "Did you think about turning me off? Don't even try. It's always"
        "Every second you're not looking at me is a wasted second. Look! It's"
    )
    
    # Select a random message from the list
    num_messages=${#messages[@]}
    random_index=$((RANDOM % num_messages))
    greeting="${messages[$random_index]}"

    
    echo "{\"text\": \"$greeting $time_format\"}"
    exit 0 

fi

# --- Standard Greeting Section (Only runs if the random roll fails) ---

if [ "$hour" -ge 0 ] && [ "$hour" -lt 5 ]; then
    greeting="Good night"
elif [ "$hour" -ge 5 ] && [ "$hour" -lt 12 ]; then
    greeting="Good morning"
elif [ "$hour" -ge 12 ] && [ "$hour" -lt 18 ]; then
    greeting="Good afternoon"
else
    greeting="Good evening"
fi

# Final output for the standard greeting
echo "{\"text\": \"$greeting, $username ₍^. .^₎⟆. It's $time_format\"}"