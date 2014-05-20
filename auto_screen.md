How to automatically start **screen**
=====================================

Add the following code to the end of your "~/.bash_profile":
```sh
# -> automatically start a screen session
if [ -z "$STARTED_SCREEN" ] && [ -n "$SSH_TTY" ]; then
   case $- in
     (*i*)
       STARTED_SCREEN=1; export STARTED_SCREEN
       screen -RR -S sshscreen  || echo "screen failed! Continuing with normal bash startup"                                     
  esac
fi
```

Source: [taint.org — Automatic 'screen' on remote logins](http://taint.org/wk/RemoteLoginAutoScreen)
