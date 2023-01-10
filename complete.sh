#USAGE

#FIRST (RECOMMENDED)WAY (steps describe how the script operates)
#1 - find 1 .mp4 file and extract from zips all files in $source dir
#2 - create dir in $dest and give it name by the .mp4 file
#3 - move .mp4 and all .srt files from $source to that dir
#4 - rename all .srt files to match name of the movie in order to work

#NOTE---you should probably change $source (22 line) and
#       $dest variable (61 line)
#       so that it matches your needs
#also make sure that .srt files are not in aditional folder within .zip file

#ALTHOUGH IT IS RARE, SOME .SRT FILES HAVE SPACES IN THEIR NAMES, THE SCRIPT WON'T
#WORK FOR THOSE - PS.it doesn't matter if .mp4 file has spaces :)

#SECOND WAY
#1 - same as first way but it only handles .srt files
#2 - useful if you already have movie in its own dir and you want to add .srt files
##IF THAT'S THE CASE, THEN BEFORE RUNNING THE SCRIPT YOU HAVE TO PROVIDED DESTINATION ARGUMENT (WHERE .SRT FILES WILL BE MOVED)##
###e.g. /path/to/script/complete.sh /home/username/Videos/target_movie.mp4 

#!/bin/bash

source="/home/pleasework/Downloads"

#extract and delete all zip files if any

zip_files=$(find "$source" -type f -name "*.zip")

if [ -z "$zip_files" ]; then
    echo "No zip files :)"
  
else

for zip_file in $zip_files
do

  unzip -q "$zip_file" -d "$source"
  rm "$zip_file"

done
fi
#------------------------------------------------------

#move .mp4 (if not already) from /downloads to /movies in the (.mp4 file name)dir
#and check if there is a dir with the same name already and
#add the new dir to destination for .srt files (e.g. /movies/new_movie)
mp4_file=$(find "$source" -type f -name "*.mp4")

if [ -z "$mp4_file" ]; then
    echo "No video files :)"
    dest=$1
  
else



first_mp4=$(ls "$source" | grep .mp4 | head -n 1)
echo $first_mp4

movie_name=$(basename "$source/$first_mp4" | cut -d'.' -f1)
#black_panther
dest="/movies"

if [ -d "$dest" ] && [ -w "$dest" ]; then

  mkdir "$dest"/"$movie_name"
  mv "$mp4_file" "$dest/$movie_name"
else

  echo "Error: Destination directory does not exist or is not writable"
  exit 1
fi


fi
#-------------------------------------------------

#move all .srt files to new movie dir and rename them to movie name in that dir

srt_downloads=$(find "$source" -type f -name "*.srt")



i=1

for srt_file in $srt_downloads
do

#if there is no .mp4 file,use positional argument(S1) as destination

    if [ -z "$mp4_file" ]; then
      echo "Moving only .srts"
#------------------------------------#
      # Construct the new file name
    if [ $i -eq 1 ]; then
        new_name="$movie_name.srt"
    else
        new_name="$movie_name($i).srt"
        echo $new_name
    fi
      # Rename the .srt file
    mv "$srt_file" "$dest$new_name"


#-------------------------------------#

    else

#if there is .mp4 file, use dynamic destination (defined from the name of the movie)

    # Construct the new file name
    if [ $i -eq 1 ]; then
        new_name="$movie_name.srt"
    else
        new_name="$movie_name($i).srt"
        echo $new_name
      
    fi
    
    # Rename the .srt file
    mv "$srt_file" "$dest/$movie_name/$new_name"
    fi

#-------------------------------------#


    # Increment the counter
    i=$((i+1))
done

