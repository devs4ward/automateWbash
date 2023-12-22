#!/bin/bash

# Use Zenity to get user input for search and year
search=$(zenity --entry --title "Enter Movie Name" --text "Movie Name:")
year=$(zenity --entry --title "Enter Year (Optional)" --text "Year:")

# Run the Python script with the inputs as command-line arguments
~/IT/extra/python/scraping/venv/bin/python3 /home/$USER/IT/extra/python/scraping/subtitles.py "$search" "$year"
