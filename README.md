# aur-updater
This is simple customizable bash script for iterating through arch linux AUR packages and updating them with git, installing updates, and cleaning up after. 

## Usage
First make sure to make the file executable:
`chmod +x aur-updater.sh`

Then please change the `build` variable to the real path of the folder you keep your AURs in. This script assumes they are all organized in one directory and in their own directories (created when doing the initial git clone from the AUR). This script doesn't account for spaces in directory names, take that into account when giving AUR folders custom names.

### Process
The script will iterate through every AUR directory and do `git pull` and if it receives an update remember that AUR needs to be updated. Then it will inform the user and prompt them for an update. NOTE updating will require sudo privileges and will prompt for sudo. The script was not intended to be run as root for safety reasons (its never a good idea to be iterating over file trees with the intent of modificaiton in root if you can avoid it).

Afterwards the script will perform `git clean -dfx` to clear the files needed to make the package.
