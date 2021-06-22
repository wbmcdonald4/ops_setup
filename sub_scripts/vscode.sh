#!/usr/bin/env zsh
# Create Sublime Text directories as they don't exist until Sublime is opened
# mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\
# mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/

# Install Package Control - interesting idea for VS code
# curl "https://packagecontrol.io/Package%20Control.sublime-package" > settings/Package\ Control.sublime-package
# cp -r settings/Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package

# Install Custom Sublime Text settings
cp -r ../settings/vs_code_settings.json ~/Library/Application\ Support/Code/User/settings.json
cp -r ../settings/vs_code_keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

