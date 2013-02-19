# .bash_profile

# Get the aliases and functions
if [ -e ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

if [ `uname` = "Darwin" ]; then
    export PATH="$(brew --prefix)/bin:$PATH"
    export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
    export MANPATH="$(brew --prefix)/opt/coreutils/libexec/gnuman:$MANPATH"
fi

if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

if which rbenv > /dev/null ; then
    eval "$(rbenv init -)";
fi

