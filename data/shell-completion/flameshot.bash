#compdef flameshot

# Shell completion for flameshot command
# To be installed in "/usr/share/bash-completion/completions/flameshot"
# and "/usr/share/zsh/site-functions/"

_flameshot() {
	local prev cur cmd gui_opts full_opts config_opts
	COMPREPLY=()

	prev="${COMP_WORDS[COMP_CWORD-1]}"
	cur="${COMP_WORDS[COMP_CWORD]}"
	cmd="gui full config launcher screen"
	screen_opts="--number --path --delay --raw --last-region -p -d -r -n"
	gui_opts="--path --delay --raw --last-region -p -d -r"
	full_opts="--path --delay --clipboard --raw --last-region -p -d -c -r"
	config_opts="--contrastcolor --filename --maincolor --showhelp --trayicon --autostart -k -f -m -s -t -a"

	case "${prev}" in
		launcher)
			return 0
			;;
		screen)
			COMPREPLY=( $(compgen -W "$screen_opts --help -h" -- "${cur}") )
			return 0
			;;
		gui)
			COMPREPLY=( $(compgen -W "$gui_opts --help -h" -- "${cur}") )
			return 0
			;;
		full)
			COMPREPLY=( $(compgen -W "$full_opts --help -h" -- "${cur}") )
			return 0
			;;
		config)
			COMPREPLY=( $(compgen -W "$config_opts --help -h" -- "${cur}") )
			return 0
			;;
		-f|--filename|-p|--path)
			_filedir -d
			return 0
			;;
		-s|--showhelp|-t|--trayicon)
			COMPREPLY=( $(compgen -W "true false" -- "${cur}") )
			return 0
			;;
		-d|--delay|-h|--help|-c|--clipboard|--version|-v|--number|-n)
			return 0
			;;
		*)
		;;
	esac

	# Options
	case "${cur}" in
		-*)
			COMPREPLY=( $( compgen -W "--version --help -v -h" -- "${cur}") )
			return 0
			;;
		--*)
			COMPREPLY=( $( compgen -W "--version --help" -- "${cur}") )
			return 0
			;;
		*)
			COMPREPLY=( $( compgen -W "${cmd}" -- "${cur}") )
			return 0
			;;
	esac
}

if [[ -n ${ZSH_VERSION} ]]; then
	autoload -U bashcompinit
	bashcompinit
fi

complete -F _flameshot flameshot
