cp -v ./commandLine/.bash_profile ~
cp -v ./commandLine/.zshrc ~
cp -v git/.gitconfig ~
cp -v git/.gitignore_global ~
cp -v git/git-completion.bash ~

if ! type brew > /dev/null 2>&1; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "Homebrew already installed"
fi

if ! type nvm > /dev/null 2>&1; then
	brew install nvm
	nvm install node
else
	echo "NVM already installed"
fi

programs=(sublime-text visual-studio-code google-chrome brave firefox karabiner-elements iterm2 mas)

for program in ${programs[@]}
do : 
   brew cask install $program
done

if mas account; then
	# Better Snap Tool
	mas install 417375580
	# Flycut
	mas install 442160987
else
	echo "Not signed in to App Store"
fi

source ~/.bash_profile
source ~/.zshrc
