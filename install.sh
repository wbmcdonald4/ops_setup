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
dotfiledir=${homedir}/GitHub/ops_setup/dotfiles

echo ${homedir}
echo ${dotfiledir}

# list of files/folders to symlink in ${homedir}
files=("bash_profile" "zshrc" "aliases")

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in $files; do
    echo $file
    echo "Creating symlink to $file in home directory."
    
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# Run the Homebrew Script
chmod +x ${homedir}/GitHub/ops_setup/sub_scripts/brew.sh
${homedir}/GitHub/ops_setup/sub_scripts/brew.sh

# re-initial terminal so that it knows to use pyenv
source ~/.zshrc 

# Run the pyenv Script
chmod +x ${homedir}/GitHub/ops_setup/sub_scripts/pyenv.sh
${homedir}/GitHub/ops_setup/sub_scripts/pyenv.sh

# Run the vscode Script
chmod +x ${homedir}/GitHub/ops_setup/sub_scripts/vscode.sh
${homedir}/GitHub/ops_setup/sub_scripts/vscode.sh


# The following two scripts typically have issues and have to be run manually
# Run the zshrc Script
chmod +x ${homedir}/GitHub/ops_setup/sub_scripts/zshrc.sh
${homedir}/GitHub/ops_setup/sub_scripts/zshrc.sh