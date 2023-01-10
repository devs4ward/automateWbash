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

persistant-state.sh - this script checks whether all data is sent and written successfuly     
Useful if you transfer larger files to remote storage (usb drives) and want to make sure that drive is in persistant state and can be ejected.    
If file manager (e.g. nautilus) is not accurated (shows 100% but transfer is not over), simply run this script, and whait till you get the output, you can safely unmount and eject usb drive.

<h3>To use these scripts on linux, follow these steps:    
</h3>

   
```       
sudo apt install git
```             
You shoud get the output of following command:     
```  
git --version       
```
```git version 2.37.2```  
Next, run this: 
```     
git clone https://github.com/devs4ward/automateWbash    
```
```
cd automateWbash    
```
make all scripts executable:     
```   
chmod +x *.sh
```

list all the scripts: ```ls```  
finally run desired script: ``` ./script_name.sh ```


<h2>Contribute</h2>         
Feel free to contribute,if you have any improvements or have other automation scripts, I would be happy to see them.

<h2>Open source</h2>     
You are free to modify, use, and distribute this project.
