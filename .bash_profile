# .bash_profile

# Get the aliases and functions
if [ -e ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

export PATH="/usr/local/bin:$PATH"

if [ `uname` = "Darwin" ]; then
    # coreutilsのコマンドをプレフィックス無しで参照
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

if which rbenv > /dev/null ; then
    eval "$(rbenv init -)";
fi

