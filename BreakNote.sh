#!/bin/bash

# Infinite loop for displaying notifications
while true; do
    sleep 2700 # Sleep for 45 minutes

    # Check if a custom note file exists
    if [ -f "StickyNote.txt" ]; then
        note=$(cat StickyNote.txt)  # Read custom note from file
        rm StickyNote.txt  # Remove the custom note file
        
    else
        note="No future plans :("  # Default note if custom note not found
    fi

    tittle="Take a Break NOW!!!"
    # Display the notification
    notify-send "$tittle" "$note"
done
