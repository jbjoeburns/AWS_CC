# Can run this when you open pycharm too, just remember to add it to gitignore
import subprocess

subprocess.run(["bash", "eval", "`ssh-agent`"], shell=True)

# asks for filename printed by previous script, will have keygen make a file later
file_name = input("Input filename for private key: ")
subprocess.run(["ssh-add", f"~/.ssh/{file_name}"])

subprocess.run(["ssh", "-t", "git@github.com"])

subprocess.run(["git", "init"])

# add and set URL
ssh_url = input("Input ssh URL: ")
subprocess.run(["git", "remote", "add", "origin", f"git@github.com:{ssh_url}"])
subprocess.run(["git", "remote", "set-url", "origin", f"git@github.com:{ssh_url}"])