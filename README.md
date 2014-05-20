bwUniCluster
============

Scripts and example files, which could be useful for the [bwUniCluster](http://www.bwhpc-c5.de/wiki/)


How to use
----------
To run the scripts you have to copy the files to your home folder on the login node.
Then you should grant execute permission to the scripts:
```
chmod +x <script>
```
Replace "&lt;script&gt;" with the name of the script.
Or directly grant permission to all scripts:
```
find . -name \*.sh -exec chmod +x {} \;
```

Finally, run the scripts by using their full path:
```
~/<script>
```

Note: You could also add a specific directory to your PATH environment variable, which tells the shell where to look for programs to run.
In that case, modify "~/.bash_profile" such that PATH includes the directory.
Seperate various pathes using ":":
> PATH=$PATH:$HOME/bin:$HOME/scripts
(Note $HOME represents the home directory, and is the same as "~")

The default "~/.bash_profile" file already adds "~/bin/" to the path.
Therefore, you can create this directory, and copy your scripts there.
```
mkdir ~/bin
```
