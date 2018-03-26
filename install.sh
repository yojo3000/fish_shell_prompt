git clone https://github.com/yojo3000/fish_shell_prompt.git ~/fish_shell_prompt
mkdir -p ~/.config/fish
cp ~/fish_shell_prompt/config.fish ~/.config/fish/
rm -rf ~/fish_shell_prompt
. ~/.config/fish/config.fish
