set -g -x PATH /usr/local/bin $PATH

alias tmux="tmux -2"
alias drm="docker rm -f (docker ps -a -q)"
alias di="docker images"
alias dp="docker ps"
alias dpa=docker_ps_format_running
alias dpaexit=docker_ps_format_exit
alias dpaother=docker_ps_format_others
alias drmnone="docker rmi (docker images --filter "dangling=true" -q --no-trunc)"
alias drmexit="docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm"

alias infosys="cat ~/.monitor.sh | bash"


set dpa_id (set_color FFE66F)'ID:\t{{.ID}}\t\t'
set dpa_state (set_color D2A2CC)'State:\t{{.State}}\t\t'
set dpa_size (set_color FF5151)'Size:\t{{.Size}}\t\t'
set dpa_status (set_color ADADAD)'Status:\t{{.Status}}\n'
set dpa_name (set_color 02DF82)'Name:\t{{.Names}}\n'
set dpa_image (set_color 84C1FF)'Image:\t{{.Image}}\n'
set dpa_port (set_color FF8040)'Ports:\t{{.Ports}}\n'

function docker_ps_format_exit
	docker ps \
	--filter "status=exited" \
	--format $dpa_name$dpa_image$dpa_port$dpa_id$dpa_state$dpa_size$dpa_status
end

function docker_ps_format_running
	docker ps \
	--filter "status=running" \
	--format $dpa_name$dpa_image$dpa_port$dpa_id$dpa_state$dpa_size$dpa_status
end

function docker_ps_format_others

	docker ps \
	--filter "status=created" \
	--filter "status=restarting" \
	--filter "status=removing" \
	--filter "status=paused" \
	--filter "status=dead" \
	--format $dpa_name$dpa_image$dpa_port$dpa_id$dpa_state$dpa_size$dpa_status
end

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
	echo -n '('(date +"%H:%M")', '

	set_color white
	echo -n ''(date +"%Y/%m/%d")') '

	set_color 33ceff

	if [ $git_branch ]
		echo -n '('$git_branch', Branch)'
	end

	echo -e

	set_color blue
	echo -n '> '

end

function fish_greeting
	echo -e
end
