mkdir -p ~/.config/fish
cp ~/fish_shell_prompt/config.fish ~/.config/fish/
cp ~/fish_shell_prompt/monitor.sh ~/.monitor.sh

git config --global alias.logs "log --graph --abbrev-commit --decorate --date=relative --all"

sudo chmod +x ~/fish_shell_prompt/dtag.py
sudo cp ~/fish_shell_prompt/dtag.py /usr/local/bin

FILE=/usr/local/bin/dtag
if test -f "$FILE"; then
	sudo rm /usr/local/bin/dtag
fi

DIR=~/fish_shell_prompt/functions
if ! test -d "$DIR"; then
	mkdir ~/.config/fish/functions
fi
cp ~/fish_shell_prompt/functions/* ~/.config/fish/functions/


#rm -rf ~/fish_shell_prompt
