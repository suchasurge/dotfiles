# Copy my favorite fonts in the Mac OS X Font Library
CWD=`pwd`
cd `dirname $0`
script_dirname=`pwd`
cd $CWD
font_direction=/Library/Fonts

for x in $(find $script_dirname/fonts -name "*.ttf")
do
  if [ -f ${font_direction}/$(basename $x) ]; then
    echo "Font $(basename $x) already exits"
  else
    cp $x ${font_direction}
  fi
done



mkdir -p ~/.vimbundles
cd ~/.vimbundles

get_bundle() {
  (
  if [ -d "$2" ]; then
    echo "Updating $1's $2"
    cd "$2"
    git pull --rebase
  else
    git clone "git://github.com/$1/$2.git"
  fi
  )
}

get_bundle leshill vim-json
get_bundle mileszs ack.vim
get_bundle pangloss vim-javascript
get_bundle scrooloose nerdcommenter
get_bundle tpope vim-cucumber
get_bundle tpope vim-endwise
get_bundle tpope vim-fugitive
get_bundle tpope vim-git
get_bundle tpope vim-haml
get_bundle tpope vim-markdown
get_bundle tpope vim-pathogen
get_bundle tpope vim-rake
get_bundle tpope vim-rails
get_bundle tpope vim-surround
get_bundle tpope vim-rvm
get_bundle tpope vim-bundler
get_bundle vim-ruby vim-ruby
get_bundle msanders snipmate.vim
get_bundle kana vim-textobj-user
get_bundle nelstrom vim-textobj-rubyblock
get_bundle vim-scripts Gundo
get_bundle scrooloose syntastic
get_bundle vim-scripts Io-programming-language-syntax
get_bundle altercation vim-colors-solarized
get_bundle kchmck vim-coffee-script
get_bundle wincent Command-T
get_bundle jgdavey vim-railscasts
get_bundle godlygeek tabular
get_bundle Lokaltog vim-powerline
get_bundle groenewege vim-less
get_bundle elixir-lang vim-elixir
get_bundle fatih vim-go
get_bundle Shougo neocomplete.vim
