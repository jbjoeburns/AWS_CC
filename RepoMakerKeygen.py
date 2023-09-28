import os
import subprocess

#os.chdir("C:/Users/joe-b/Documents/Coding/RepoMakerScript")
repo_dir = os.getcwd()

# going to ssh folder
os.chdir("C:/Users/joe-b/.ssh")
print(os.getcwd())

# getting list of .pub files already in there
old_dir = subprocess.run(["ls", "*.pub"], stdout=subprocess.PIPE).stdout.splitlines()
print(old_dir)

# generating new public and private keys
subprocess.run(["ssh-keygen", "-a", "-t", "rsa", "-b", "4096", "-C", "joe-burns@live.co.uk"])
os.wait()

# getting list of new .pub files and comparing them to the old ones
new_dir = subprocess.run(["ls", "*.pub"], stdout=subprocess.PIPE).stdout.splitlines()
print(new_dir)

new_ssh_files = [x for x in new_dir if x not in old_dir]
print(new_ssh_files)

# extracts the public key and prints it
public_key_file = str(new_ssh_files[0])
public_key_string = os.system(f"cat {public_key_file}")
print(f"Public key is: \n{public_key_string}")

# gets the filename we need to connect and prints it
print(f"Filename is: \n{public_key_file.replace('.pub', '')}")

# returns back to project directory
os.chdir(repo_dir)
print(os.getcwd())