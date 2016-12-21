

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



#PATH
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin
export EDITOR='subl -w'
#add Homebrew’s sbin to PATH
export PATH=/usr/local/sbin:$PATH
