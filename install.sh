#!/usr/bin/env zsh
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/dotfiles
# And also installs Homebrew Packages
# And sets VS Code preferences
############################

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

homedir=$1

# dotfiles directory
dotfiledir=${homedir}/ops_setup/dotfiles

# list of files/folders to symlink in ${homedir}
files="bash_profile zshrc aliases"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# Intsll oh-my-zsh (this might need to be done first) - also need to run command to clear .zshrc file after this install
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# clone zsh-autosuggestions into oh-my-zsh
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# clone zsh-syntax-highlighting into oh-my-zsh
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# clone powerlevel10k into oh-my-zsh
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# remember to turn set this variable to true
# typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=true


# Run the Homebrew Script
# ${homedir}/ops_setup/sub_scripts/brew.sh

# Run the pyenv Script
# ${homedir}/ops_setup/sub_scripts/pyenv.sh

# Run the vscode Script
# chmod +x ${homedir}/ops_setup/sub_scripts/vscode.sh # give executable permissions to the file
# ${homedir}/ops_setup/sub_scripts/vscode.sh

# Git Auto Clone
# johto
# opspipeline

