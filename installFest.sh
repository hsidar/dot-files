if ! type brew > /dev/null 2>&1; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "Homebrew already installed"
fi

if ! type zsh > /dev/null 2>&1; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
	echo "Zsh already installed"
fi

if ! type nvm > /dev/null 2>&1; then
	brew install nvm
else
	echo "NVM already installed"
fi

programs=(sublime-text google-chrome brackets brave firefox karabiner-elements iterm2)

for program in ${programs[@]}
do : 
   brew cask install $program
done

cp -v ./commandLine/.bash_profile ~
cp -v ./commandLine/.zshrc ~
cp -v git/.gitconfig ~
cp -v git/.gitignore_global ~
cp -v git/git-completion.bash ~
source ~/.bash_profile
source ~/.zshrc

defaults write com.apple.desktopservices DSDontWriteNetworkStores true