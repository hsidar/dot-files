cp -v ./commandLine/.bash_profile ~ &>/dev/null
cp -v ./commandLine/.zshrc ~ &>/dev/null

# Git configuration
cp -v git/.gitignore_global ~ &>/dev/null
git config --global core.excludesfile ~/.gitignore_global &>/dev/null
git config --global core.mergeoptions --no-edit &>/dev/null
git config --global core.editor subl &>/dev/null

if ! git config --global user.name &>/dev/null; then
	echo "What name do you want to use for Git commits?"
	read gitName
	git config --global user.name $gitName &>/dev/null
fi

if ! git config --global user.email &>/dev/null; then
	echo "What is your email for Git?"
	read gitEmail
	git config --global user.email $gitEmail &>/dev/null
fi


# Install Homebrew and use it to install programs
if ! type brew &>/dev/null; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install programs
oldIFS=$IFS
IFS="" # This overwrites a default that causes all spaces in arrays to behave as array delimiters.
brewPrograms=(sublime-text visual-studio-code google-chrome brave firefox vivaldi karabiner-elements iterm2 postman hipchat slack sequel-pro skype-for-business docker)
appStorePrograms=("Microsoft Remote Desktop" "Better Snap Tool" "Flycut")

echo "Do you want to install Homebrew and App Store programs? y/n"
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
	
	brewProgramsToInstall=()

	for program in ${brewPrograms[@]}
	do : 
		echo "Do you want to install $program? Y/N"
		read REPLY
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			brewProgramsToInstall+=($program)
		fi
	done

	for program in ${appStorePrograms[@]}
	do : 
		echo "Do you want to install $program? Y/N"
		read REPLY
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			appStoreProgramsToInstall+=($program)
		fi
	done

	for program in ${brewProgramsToInstall[@]};
	do
		brew cask install $program
	done

	# Log into Apple account and install App Store apps
	if ! type mas &>/dev/null 2>&1; then
		brew install mas
		echo "What is your Apple ID?"
		read appleID
		mas signin --dialog $appleID
	elif ! mas account &>/dev/null; then
		echo "What is your Apple ID?"
		read appleID
		mas signin --dialog $appleID
	fi

	for program in "${appStoreProgramsToInstall[@]}";
	do
		case "$program" in 
		"Better Snap Tool")
			mas install 417375580
			;;
		"Flycut")
			mas install 442160987
			;;
		"Microsoft Remote Desktop")
			mas install 1295203466
			;;
		esac
	done
fi

# Change default system settings
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
echo "Three finger drag enabled"
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false
echo "Swipe scrolling disabled"
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
echo "Tap to click enabled"
defaults write com.apple.menuextra.battery ShowPercent -string YES
echo "Show battery percent enabled"
defaults write com.apple.dock autohide -bool true
echo "Autohide Dock enabled"

#Change desktop wallpaper
IFS=$oldIFS
echo "What image do you want to make your background?"
backgroundImages=($(ls ./images/desktops/))
backgroundImages+=("None")
select backgroundFile in ${backgroundImages[@]};
do
	if [ "$backgroundFile" != "None" ] && [ "$backgroundFile" != "" ]; then
		background="osascript -e 'tell application \"Finder\" to set desktop picture to POSIX file \"$(pwd)/images/desktops/${backgroundFile}\"'"
		eval $background
		echo "Wallpaper is now ${backgroundFile}"
	else
		echo "Wallpaper not changed"
	fi
	break;
done

# Install Zsh. Changing terminals exits program, so this goes last
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
