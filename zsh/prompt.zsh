autoload colors && colors

prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [[ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]]; then

		# check if the current directory is in .git before running git checks
		if [[ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null;

			# Check for uncommitted changes in the index.
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+';
			fi;

			# Check for unstaged changes.
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='!';
			fi;

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?';
			fi;

			# Check for stashed files.
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$';
			fi;

		fi;

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		[ -n "${s}" ] && s=" [${s}]";

    local output="";
    output+="%{$fg_bold[blue]%}on ";
    output+="%{$fg_bold[cyan]%}${branchName}";
    output+="%{$fg_bold[blue]%}${s}";
		echo "$output";
	fi;
}

last_two_dirs() {
  pwd | rev | awk -F / '{print $1,$2}' | rev | sed s_\ _/_
}

PROMPT=$'%{$fg_bold[green]%}%n '; # username
PROMPT+=$'%{$fg_bold[blue]%}at ';
PROMPT+=$'%{$fg_bold[yellow]%}%m '; # host
PROMPT+=$'%{$fg_bold[blue]%}in ';
PROMPT+=$'%{$fg_bold[red]%}$(last_two_dirs) '; # working directory
PROMPT+=$'$(prompt_git) '; # Git repository details
PROMPT+=$'\n';
PROMPT+=$'%{$fg_bold[blue]%}$ '; # `$`
PROMPT+=$'%{$reset_color%}';
export PROMPT;

precmd() {
  title "zsh" "%m" "%55<...<%~"
}
