# Ubuntu_BackupScript
## IMPORTANT TO READ
This version allows the users to backup his files and folder in a backup folder, indicates in the backup script at the head of the script.
### You should to create first the folder structure before backup your files, if its a folder it dosen't matter, but its a file you should to create first the folder structure in the backup folder

For example:
Imagine that you want to backup the file, and also you will rename this file like:
/mnt/c/Users/Oscar/Desktop/file.txt Personal/Documents/file.txt

First you need to create the folder structure of the backup file, I mean create first $backupFolder/Personal/Documents/ and then backup the file. 
You can create this structure automaticly doing a backup of other folder that creates the folder structure. 

### To solve this problem you need to write in the backupFile the next lines:
/mnt/c/Users/Oscar/Desktop/folder Personal/Documents/Personal_Folder <= creates the folder structure

/mnt/c/Users/Oscar/Desktop/file.txt Personal/Documents/file.txt <= then backups the file
