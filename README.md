dotfiles
========

This is a set of basic files I keep in my home dir on all the servers 
I work with. The technique for managing them is the one described by
Ryan Tomayko [here](https://github.com/rtomayko/dotfiles#readme).

Usage
-----

First install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh):

    cd $HOME
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    chsh -s /bin/zsh

Logout. Login. Then …

    rm .zshrc
    git init
    echo "*" >> .git/info/exclude
    git remote add origin git://github.com/philippbosch/dotfiles.git
    git pull origin master

The following line is only for my custom oh-my-zsh theme. If you don't 
need that change `ZSH_THEME` in `.zshrc` accordingly.

    curl https://raw.github.com/philippbosch/oh-my-zsh/master/themes/philippbosch.zsh-theme > .oh-my-zsh/themes/philippbosch.zsh-theme

Logout. Login. Finished.
