mkdir -p ~/.config/fish
cp ~/fish_shell_prompt/config.fish ~/.config/fish/
cp ~/fish_shell_prompt/monitor.sh ~/.monitor.sh
git config --global alias.logs "log --graph --abbrev-commit --decorate --date=relative --all"
sudo chmod +x ~/fish_shell_prompt/dtag
sudo cp ~/fish_shell_prompt/dtag /usr/local/bin
cd ~
rm -rf ~/fish_shell_prompt


