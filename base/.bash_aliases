set -o vi
shopt -s autocd
shopt -s extglob
shopt -s globstar
shopt -s lithist
bind "set completion-ignore-case on"

unalias -a

git_branch () {
	GIT_BRANCH="$(git branch --show-current 2> /dev/null)"
	if [ $? -eq 0 ]; then
		echo -n " (${GIT_BRANCH})"
	fi
}

ssh_info() {
	if [ -n "${SSH_CONNECTION}" ]
	then
		echo -n " (ssh: ${USER}@${HOSTNAME})"
	fi
}

export PS1='\[\e[m\]\W\[\e[1;93m\]$(ssh_info)$(git_branch) \$\[\e[m\] '

export DF=$(cat ~/.dotfiles.path)

export PATH=\
${HOME}/.bin:\
${HOME}/.local/bin:\
${DF}/scripts:\
${PATH}

export CDPATH=\
./:\
${HOME}/:\
${HOME}/repos/gitlab.com/_joao.fukuda/:\
${HOME}/repos/gitlab.com/joao.fukuda/:\
${HOME}/repos/github.com/JoaoFukuda/:\
${HOME}/repos/tmp/:\
${HOME}/Documents:

export HISTCONTROL=ignoreboth:erasedups
export EDITOR=nvim

alias g=git

alias gad='git add'
alias gbr='git branch'
alias gch='git checkout'
alias gcm='git commit'
alias gcp='git cherry-pick'
alias gct='git cat-file -p'
alias gdf='git diff'
alias glg='git log --oneline --all --graph --decorate'
alias grm='git remote'
alias gst='git status'
alias gsw='git switch'

alias vim=nvim

alias ?=duck
alias alacritty='alacritty -e simple_tmux'
alias apod='elinks https://apod.nasa.gov/apod/'
alias build="cd build ; make -j ; cd -"
alias dotfiles='cd ${DF}'
alias grep='grep --color'
alias ll='ls -lA'
alias ls='ls --color=auto'
alias ms=monsetup
alias pwdc='keepassxc-cli clip -k ${HOME}/.passdb.key /run/media/coccafukuda/passwords/database'
alias tmpd='cd $(mktemp -d)'
alias todos='grep --color -Ern "TODO:|FIXME:"'
alias torw='echo http://zqktlwiuavvvqqt4ybvgvi7tyo4hjl5xgfuvpdf6otjiycgwqbym2qad.onion/wiki/index.php/Main_Page'

mkcmk() {
	echo -e "cmake_minimum_required(VERSION 3.5)\nproject($(pwd | grep -o -E '[^/]*$'))\n\n" > CMakeLists.txt
	nvim -c 'normal G<Esc>' -c 'startinsert' CMakeLists.txt
}

