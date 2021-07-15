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

# Run the zshrc Script
${homedir}/ops_setup/sub_scripts/zshrc.sh

# Run the Homebrew Script
${homedir}/ops_setup/sub_scripts/brew.sh

# Run the pyenv Script
${homedir}/ops_setup/sub_scripts/pyenv.sh

# Run the github Script
${homedir}/ops_setup/sub_scripts/github.sh

# Run the vscode Script
chmod +x ${homedir}/ops_setup/sub_scripts/vscode.sh # give executable permissions to the file
${homedir}/ops_setup/sub_scripts/vscode.sh

