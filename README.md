# インストール
~~~
cd ~
git clone git@github.com:tsujita/dotfiles.git .dotfiles
ln -s .dotfiles/.bash_profile .bash_profile
ln -s .dotfiles/.bashrc .bashrc
ln -s .dotfiles/.gitconfig .gitconfig
ln -s .dotfiles/.tmux.conf .tmux.conf
ln -s .dotfiles/.vim .vim
ln -s .dotfiles/.vimrc .vimrc
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
~~~

# Vimプラグインインストール
~~~
vim
:NeoBundleInstall
:q
~~~

## OS X

~~~
brew install git
brew install w3m
brew install nkf
brew install tmux
brew install ctags
brew install coreutils
# vimインストール
brew install mercurial
brew install vim
# rubyインストール
brew install rbenv
brew install ruby-build
brew tap homebrew/dupes
brew install apple-gcc42
CC=/usr/local/bin/gcc-4.2 rbenv install 1.9.3-p385
~~~

