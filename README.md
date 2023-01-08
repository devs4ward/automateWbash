<h1>Automate the boring stuff with bash</h1>
Everyone likes when the computer does all the job right? 😁                                                     

    
I've written these bash scripts to automate my boring stuff. :relieved:

Here is what they are for:

complete.sh - if you download a movie (legitimately, of course!) sometimes you'll need subtitles for it.       
Now those subtitles come in zip files, and you need to move all the .srt files and .mp4 file into the same directory, and rename all the subtitles so that they match the movie name in order to get the job done.       
You can tell that this takes time and is not efficient.    
Well, you are lucky because this script does all that for you in one go!  

Just download your movie (.mp4 extension) and all the subtitles for it, make sure they are all in the same directory, and run the script.     
Voila! Your movie is in a separate directory with all the subtitles renamed in one go.       
For more info, see the script.

debs.sh - download all deb packages in dir and remove them because they are no longer needed.

To use these scripts on linux(using apt) , follow these steps:    

install git: sudo apt install git   
clone repo: git clone https://github.com/devs4ward/automateWbash    
change dir: cd automateWbash    

edit scripts to match your needs:nano script_name.sh    
finally run the script: ./script_name.sh     


if didn't work ,check if scripts have execute permissions       
if not:
chmod +x *.sh --> this will make all bash scripts executable in current directory 

<h2>Contribute</h2>         
Feel free to contribute,if you have any improvements or have other automation scripts, I would be happy to see them.

<h2>Open source</h2>     
You are free to modify, use, and distribute this project.
