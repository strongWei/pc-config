source $HOME/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle docker-compose

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme ys

# Tell Antigen that you're done.
antigen apply

setopt no_nomatch #rm -rf * 失败

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

YARN_DIR="$HOME/.yarn"
export PATH=$PATH:$YARN_DIR/bin

# 效率低
#composer () {
#    tty=
#    tty -s && tty=--tty
#    docker run \
#        $tty \
#        --interactive \
#        --rm \
#        --user $(id -u):$(id -g) \
#        --volume /etc/passwd:/etc/passwd:ro \
#        --volume /etc/group:/etc/group:ro \
#        --volume $(pwd):/app \
#        --volume $HOME/composer:/tmp \
#        composer "$@"
#}

#Composer global installer
COMPOSER_DIR="$HOME/.config/composer/vendor"
export PATH=$PATH:$COMPOSER_DIR/bin

#Resilio sync
DATA_FOLDER=/data/syncthing
WEBUI_PORT=8888

#privoxy
#export http_proxy=http://127.0.0.1:38205
#export https_proxy=http://127.0.0.1:38205

#apt-fast
alias apt='apt-fast'

#yarn project
export YARN_PRO="$HOME/Documents/js/yarn-pro"
alias cnmpdemo='docker run -it --rm -p 8000:8000 -m "300M" --memory-swap "1G" --mount type=bind,source=$YARN_PRO/data,target=/home/node/app cnmpdemo'
