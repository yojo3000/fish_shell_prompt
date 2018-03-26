set -g -x PATH /usr/local/bin $PATH

alias drm="docker rm -f (docker ps -a -q)"
alias di="docker images"
alias dp="docker ps"
alias dpa="docker ps -a"
alias drmnone="docker rmi (docker images --filter "dangling=true" -q --no-trunc)"

alias infosys="cat ~/.monitor.sh | bash"

function fish_prompt
	echo -e

	set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')

	set_color FFCC22
	echo -n (whoami)

	set_color 008800
	echo -n ' @ '

	set_color FF3333
	echo -n (hostname)
	echo -n ' : '

	set_color FFB3FF
	echo -n (pwd)' '

	set_color white
	echo -n '('(date +"%Y/%m/%d %I:%M %p")') '

	set_color blue

	if [ $git_branch ]
		echo -n '('$git_branch')'
	end

	echo -e

	set_color blue
	echo -n '> '

end

function fish_greeting
	echo -e
end
