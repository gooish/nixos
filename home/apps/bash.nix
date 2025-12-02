{
    programs.bash = {
		enable = true;
		enableCompletion = true;
		shellAliases = {
			mkcdir = "mkdir $_ && cd $_";
		};
		initExtra = ''
			if uwsm check may-start && uwsm select; then
				exec uwsm start default
			fi
		'';
	};
}