if ! type brew > /dev/null 2>&1; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "Homebrew already installed"
fi

if ! type brew > /dev/null 2>&1; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
	echo "Zsh already installed"
fi

programs=(sublime-text google-chrome brackets brave firefox karabiner-elements iterm2)

for program in ${programs[@]}
do : 
   brew cask install $program
done

ssh-keygen -t rsa -b 4096 -C "marcus.estremera@gmail.com"



ssh-keygen -t rsa -b 4096 -C "marcus.estremera@gmail.com"