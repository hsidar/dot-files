

function werk {
	cd ~/werk
}

function server {
    python -m SimpleHTTPServer
}

function phpserver {
    php -S localhost:8000
}

source ~/git-completion.bash

function mkcd {
  last=$(eval "echo \$$#")
  if [ ! -n "$last" ]; then
    echo "Enter a directory name"
  elif [ -d $last ]; then
    echo "\`$last' already exists"
  else
    mkdir $@ && cd $last
  fi
}


#PATH
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin
export EDITOR='subl -w'
#add Homebrew’s sbin to PATH
export PATH=/usr/local/sbin:$PATH
