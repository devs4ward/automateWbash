#Automate the boring stuff with bash
Everyone likes when the computer does all the job right? 😁 Well, I am one of them too! As a beginner, I've written these bash scripts to automate my boring stuff. :relieved:

Here is what they are for:

complete.sh - if you download a movie (legitimately, of course!) sometimes you'll need subtitles for it. Now those subtitles come in zip files, and you need to move all the .srt files and .mp4 file into the same directory, and rename all the subtitles so that they match the movie name in order to get the job done. Well, what this script does is: extract and move all the .srt files with the .mp4 file into a new directory with the name of the .mp4 file (obviously...) and rename all the .srt files to the name of the .mp4 file in order to work.

TL;DR: Just download your movie (.mp4 extension) and all the subtitles for it, make sure they are all in the same directory, and run the script.
Voila! Your movie is in a separate directory with all the subtitles renamed in one go.
For more info, see the script.

To download the script on linux(apt) , follow these steps:
install git: sudo apt install git
clone repo: git clone https://github.com/devs4ward/automateWbash
change dir: cd automateWbash
edit scripts to match your needs:nano script_name.sh
finally run the script:./script_name.sh

if didn't work ,check if scripts have execute permissions,if not:
chmod +x \*.sh --> this will make all bash scripts executable in current directory

##Contribute
Feel free to contribute,if you have any improvements or have other automation scripts, I would be happy to see them.

##Open Source
You are free to modify, use, and distribute this project.
