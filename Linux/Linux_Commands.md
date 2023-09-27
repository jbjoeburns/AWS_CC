## Shell Commands (shell is a UI that lets you input commands)

### Piping
**USING `|` IS CALLED PIPING!!**

Piping is useful for chaining multiple compatible commands together!

### Apt

Note: Many `apt` commands require you to use `sudo` before the command. This executes the command at the superuser level.

`sudo apt update`: Updates the linux software, and also indecently confirms that you have internet connection.

`sudo apt upgrade -y`: Upgrades any updated software to the latest installed version. The -y is 'yes' for a confirmation later that will ask you if you're sure.

`sudo apt install <name> -y`: Installs software. The 'name' refers to the name of the software, eg nginx.

### nginx Commands

`sudo systemctl start nginx`: Starts nginx.

`sudo systemctl status nginx`: Checks if nginx is running.

### uname

`uname`: Useful to find out about the system.

`uname -a`: Gives you more system info.

`uname -p`: Gives you the processor info specifically.

### whoami

`whoami`: Gives info on the user.

### cat and nl

`cat <filename>`: Displays content of files and folders.

`cat <filename> | grep <word>`: Will show all the lines with the specified word in them.

`nl <filename>`: Works similar to cat, but will give the numbers of each line in the file.

### history

`history`: Displays command history.

`history -c`: Clears history, which is important for removing traces of passwords and other sensitive information.

### curl

`curl <url> <filename>`: Allows you to transfer data, so can download images from URL for example. Filename is the name you want to give the downloaded file.

`curl --output <url> <filename>`:  Gives info on the download, speeds for example.

### mv, rm and cp

`mv <filename> <location>`: Moves files and folders.

`mv <filename> <new filename>`: Also has use in renaming, with new filename being what you want to change the name to.

`rm <filename>`: Removes a file.

`rm -r <filename>`: Removes a directory.

`rm -rf <filename>`: Force remove a directory, good if the directory has contents you want to also remove, but be careful using this.

`cp <filename> <new filename>`: Copy files, need to attribute a new name to the copy if it's in the same directory as the original.

### file

`file <filename>`: Gives information on a file, e.g. filetype data. This is not like cat, which just displays the contents.

### pwd, mkdir and cd

`pwd`: gives CWD.

`mkdir <directoryname>`: Make a directory with a given name.

`cd <path>`: Change directory.

`cd ..`: Moves up one directory.

### touch

`touch <filename>`: Creates a blank, typeless file.

### nano

`nano <filename>`: Linux in built text editor.
1. If filename does not already exist, this will create the text file with that name then let you edit it.

### head and tail

`head <filename>`: Gives you top lines of a file.

`tail <filename>`: Gives you bottom lines of a file.

For both, you can use the argument `-<number>` will give you the specified number of lines starting from the top/bottom for head/tail respectively.

### tree

`tree <path>`: Works like treesize on windows, **needs to be installed first**.

