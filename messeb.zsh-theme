ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

pods_status() {
	if [[ -s ./Podfile ]] ; then 

		RUBY_RVM_VERSION="%{$fg[yellow]%}rvm:%{$fg[red]%}$(~/.rvm/bin/rvm-prompt s i v g)%{$reset_color%}"
		PODS_VERSION="%{$fg[yellow]%}pods:%{$reset_color%}%{$fg[red]%}\$(pod --version) %{$reset_color%}%"
		
		IOSRPS1="$PODS_VERSION / $RUBY_RVM_VERSION"

		RPS1="$IOSRPS1 $EPS1"
	else 
		RPS1=""
	fi
}

precmd() { pods_status; }

PROMPT='$(git_custom_status)%{$fg[cyan]%}[%1~] %{$reset_color%}%B$%b '