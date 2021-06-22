# enable instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# load personal prompt config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# set zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"
# set zsh home
export ZSH=$HOME/.oh-my-zsh

# set zsh plugins
plugins=(
    colorize
    dotenv
    git
    # pipenv - faced issues with this
    pyenv
    sudo
    vscode
    yarn
    zsh_reload
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# source oh-my-zsh.sh
source $ZSH/oh-my-zsh.sh

# load aliases:
source $HOME/.aliases

# disable pipenv from inheritting parent directories
export PIPENV_NO_INHERIT=True

# Github pull request function
function gpr {
  if [ $? -eq 0 ]; then
    github_url=`git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#http://#' -e 's@com:@com/@' -e 's%\.git$%%'`;
    branch_name=`git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3`;
    pr_url=$github_url"/compare/main..."$branch_name
    open $pr_url;
  else
    echo 'failed to open a pull request.';
  fi
}
