#!/bin/bash

# Launch a terminal window for user input
gnome-terminal \
    --title="REMINDING MESSAGE!" \
    -- /bin/bash -c '
        echo "Enter a custom message: "
        read StickyNote
        echo "$StickyNote" > /scripts/StickyNote.txt
        exit
    '
