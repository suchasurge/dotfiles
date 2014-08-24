. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PGHOST=localhost
# Add gvim to PATH
eval "$(direnv hook zsh)"
export GVM_ROOT=$HOME/.gvm
export GVM_VERSION=$(cat "$GVM_ROOT/VERSION")
export PATH="$GVM_ROOT/bin:$PATH"
export GOPATH=$PATH


source /usr/local/bin/aws_zsh_completer.sh

#source /usr/local/bin/virtualenvwrapper.sh

function xc {
    xcode_proj=`find . -name "*.xc*" -d 1 | sort -r | head -1`

    if [[ `echo -n $xcode_proj | wc -m` == 0 ]]
    then
        echo "No xcworkspace/xcodeproj file found in the current directory."
    else
        echo "Found $xcode_proj"
        open "$xcode_proj"
    fi
}
