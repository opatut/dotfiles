git_prompt_info () {
    ref=$(command git symbolic-ref HEAD 2> /dev/null)  || ref=$(command git rev-parse --short HEAD 2> /dev/null)  || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty)${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

VIRTUAL_ENV_DISABLE_PROMPT='1' 

function virtualenv_info { 
    [ $VIRTUAL_ENV ] && echo "%{$fg_bold[black]%} using %{$fg_bold[magenta]%}"`basename $VIRTUAL_ENV`
}

_WHO="%{$fg_bold[blue]%}%n@%m%{$fg_bold[black]%}"
_WHERE="%{$fg_bold[yellow]%}%d%{$fg_bold[black]%}"
_INFO=$(git_prompt_info)$(virtualenv_info)

PROMPT='
%{$fg_bold[black]%}--» $_WHO in $_WHERE$(git_prompt_info)$(virtualenv_info)
%{$fg_bold[black]%}--» %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" on "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="$fg_bold[red]"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg_bold[green]"
