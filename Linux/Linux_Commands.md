## Shell

### Piping
**USING `|` IS CALLED PIPING!!**

Piping is useful for chaining multiple compatible commands together!

### bash scripting

Use nano for this! Good to plan out what the script will do using pseudocode (write comments first about what you want the script to do before any actual commands).

`nano <script name>.sh` 

Then, when in the text editor include...

`#!/bin/bash` which tells the system to use bash as an interpreter.

Write the script and save the file.

`sudo chmod +x <filename>.sh` makes the file executable

`./<filename>.sh` runs the script!

***For example!***
```
    #!/bin/bash
    
    #update packages
    sudo apt update
    
    #upgrade packages
    sudo apt upgrade -y
    
    #install nginx
    sudo apt install nginx -y
    
    #restart/start nginx
    sudo systemctl restart nginx
    
    #enable nginx
    sudo systemctl enable nginx
```

Setting variables can be done using `variable_name=` then whatever command you want, surrounded by backticks.

### Running in background

Use `&` after a command to have it run in the background rather than the foreground.

For example, `sleep 50 &` will have sleep run for 50 seconds in the background.

## Commands

### Apt

Note: Many `apt` commands require you to use `sudo` before the command. This executes the command at the superuser level.

`sudo apt update`: Updates the linux software, and also indecently confirms that you have internet connection.

`sudo apt upgrade -y`: Upgrades any updated software to the latest installed version. The -y is 'yes' for a confirmation later that will ask you if you're sure.

`sudo apt install <name> -y`: Installs software. The 'name' refers to the name of the software, eg nginx.

### nginx Commands

`sudo systemctl start nginx`: Starts nginx.

`sudo systemctl status nginx`: Checks if nginx is running.

`sudo systemctl restart nginx`: Restarts nginx, generally better as it will start it if it's not running, and restart it if it is.

`sudo systemctl enable nginx`: Starts nginx.

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

### ps and top

`ps`: Will tell you all the processes **the current user** has running.

Every process has a PID (process id) and CMD is the command that was used to initiate that process.

`ps --help simple`: This will tell you the arguments you can use with ps.

`ps -A`: This will show you **ALL** processes, not just the ones started by the user.

`ps -v`: Gives a more ***v***erbose description of each process.

`top`: Gives live readout of top resources, ranked by what the user chooses (like ctrl M will rank by most memory used)

### sleep

`sleep <number>`: Runs a dummy process for a defined number of seconds in the foreground, prevents user inputs because of this.

### kill

`kill -1 <PID>`: Will kill a process. PID can be obtained from `ps`.

Can use `-15` rather than `-1` to force end a process. If this fails to work you can use `-9`, which will absolutely kill a process. Additionally `kill -KILL <PID>` functions the same as `-9`.

### ls

`ls`: Lists files in CWD. `-a` lists hidden files too.

`ls -l`: Lists permissions that files in a directory have. Starts with owner rwx permissions, then elevated group, then standard user. Formatted as drwxrwxrwx, where the d denotes a directory.

### chmod

Stands for change mode. Allows changing of permissions.

`chmod <user type>+<permission> <filename>`: Where user type is o for owner, g for group and u for user. Permissions can be r, w, x for read, write and execute respectively.

Can also use shorthand `chmod <number code> <filename>`: Where the number code is a shorthand for what user gets what permission. You can calculate this number using sites like https://chmod-calculator.com/.

### env and printenv

`printenv` or `env`: Prints current environment variables. Format is "VARIABLE: variable contents".

`printenv <variable>`: Prints content of specified variable.

`<VARIBLE>=<contents>`: Creates new **local** variable to specifications. Makes it in your bash client.

`export <VARIBLE>=<contents>`: Creates new **global** variable to specifications. Creates it on an OS level.

### scp

`scp`: Copies files from local machine .

`scp -i "<filepath to .pem file>" -r <filepath to your local app folder> Ubuntu@<public IP>:<remote filepath>`: Will copy local files to AWS servers. -i is for identifier, and needs to be followed with filepath to private key. -r is for recursive and should precede any folders you want to copy.