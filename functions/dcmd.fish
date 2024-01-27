function dcmd
	nsenter -t (docker inspect -f '{{.State.Pid}}' $argv[1]) -n $argv[2..-1]
end
