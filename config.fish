set -g -x PATH /usr/local/bin $PATH
set -g -x PATH $HOME/.local/bin $PATH
set -g -x PATH $HOME/.krew/bin $PATH

alias tmux="tmux -2"
alias drm="docker rm -f (docker ps -a -q)"
alias di="docker images"
alias dp="docker ps"
alias dpa=docker_ps_format_running
alias dpaexit=docker_ps_format_exit
alias dpaother=docker_ps_format_others
alias drmnone="docker rmi (docker images --filter "dangling=true" -q --no-trunc)"
alias drmexit="docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm"

alias kk=kubectl

alias dtag=/usr/local/bin/dtag.py

alias infosys="cat ~/.monitor.sh | bash"

alias iplocation=ip_location

function ip_location
	curl https://ipinfo.io/$argv
end

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

	set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')

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
		echo -n '(G: '$git_branch') '
	end


	set_color yellow

	if test (whoami) = 'root'
		set -l k8s_ns (kubectl config view --minify -o jsonpath='{..namespace}')
		if [ $k8s_ns ]
			echo -n '(K: '$k8s_ns')'
		end
	end


	set_color blue

	echo -e
	echo -n '> '

end

function fish_greeting
	echo -e
end
