mkdir -p ~/.config/fish
cp ~/fish_shell_prompt/config.fish ~/.config/fish/
cp ~/fish_shell_prompt/monitor.sh ~/.monitor.sh
cd ~
rm -rf ~/fish_shell_prompt
. ~/.config/fish/config.fish
