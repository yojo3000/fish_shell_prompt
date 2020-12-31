mkdir -p ~/.config/fish
cp ~/fish_shell_prompt/config.fish ~/.config/fish/
cp ~/fish_shell_prompt/monitor.sh ~/.monitor.sh
git config --global alias.logs "log --graph --abbrev-commit --decorate --date=relative --all"
sudo chmod +x dtag
sudo cp dtag /usr/local/bin
cd ~
rm -rf ~/fish_shell_prompt


