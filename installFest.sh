cp -v ./commandLine/.bash_profile ~
cp -v ./commandLine/.zshrc ~
cp -v git/.gitconfig ~
cp -v git/.gitignore_global ~

echo "What name do you want to use for Git commits?"
read gitName
git config --global user.name $gitName

echo "What is your email for Git?"
read gitEmail
git config --global user.email $gitEmail

if ! type brew > /dev/null 2>&1; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "Homebrew already installed"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if ! type mas > /dev/null 2>&1; then
	brew install mas
else
	echo "NVM already installed"
fi

if ! type nvm > /dev/null 2>&1; then
	brew install nvm
	nvm install node
else
	echo "NVM already installed"
fi

programs=(sublime-text visual-studio-code google-chrome brave firefox vivaldi karabiner-elements iterm2 postman hipchat slack sequel-pro skype-for-business)

for program in ${programs[@]}
do : 
	echo "Do you want to install $program? Y/N"
	read REPLY
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		brew cask install $program
	fi
done

if ! mas account; then
	echo "What is your Apple ID?"
	mas signin --dialog $appleID
fi

if mas account; then
	# Better Snap Tool
	mas install 417375580
	# Flycut
	mas install 442160987
	# Microsoft Remote Desktop
	mas install 1295203466
else
	echo "You are not logged in to the App Store"
fi

# Change default system settings

defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.apple.dock autohide -bool true

source ~/.bash_profile
source ~/.zshrc
