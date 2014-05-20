bwUniCluster
============

Scripts and example files, which could be useful for the [bwUniCluster](http://www.bwhpc-c5.de/wiki/)


Repository Content
------------------
### Scripts:
- submit_job.sh: template script to submit jobs to the cluster
- run_job.sh: runscript template to run a job on a cluster node
- stop_all_jobs.sh: script that cancels all your jobs (asks for permission first)

### Tips and Tricks:
- auto_screen.md: shows how to start a screen session when logging in



How to use the Scripts
----------------------

To run the scripts you have to copy the files to your home folder on the login node.
Then you should grant execute permission to the scripts:
```sh
chmod +x <script>
```
Replace "&lt;script&gt;" with the name of the script.
Or directly grant permission to all scripts:
```sh
find . -name \*.sh -exec chmod +x {} \;
```

Finally, run the scripts by using their full path:
```sh
~/<script>
```

Note: You could also add a specific directory to your PATH environment variable, which tells the shell where to look for programs to run.
In that case, modify "~/.bash_profile" such that PATH includes the directory.
Seperate various pathes using ":":
> PATH=$PATH:$HOME/bin:$HOME/scripts

(Note: $HOME represents the home directory, and is the same as "~")

The default "~/.bash_profile" file already adds "~/bin/" to the path.
Therefore, you can create this directory, and copy your scripts there.
```sh
mkdir ~/bin
```
