#!/bin/sh

DOTPATH="$HOME/dotfiles"
export DOTPATH

cd $DOTPATH

for dotfile in `ls .??*`
do
    [ "$dotfile" = ".git" ] && continue
    [ "$dotfile" = ".DS_Store" ] && continue

    echo
    echo "loading $dotfile ..."
    if [ -e "$HOME"/"$dotfile" ] ; then
      /bin/echo -n "overwrite ~/$dotfile ? (yn) > "
      read yn
      if [ ${yn:-"no"} = "yes" ] || [ ${yn:-"no"} = "y" ] ; then
        ln -snfv "$DOTPATH"/"$dotfile" "$HOME"/"$dotfile"
      fi
    fi
done

echo
echo "loading .zshrc ..."
./zshrc/deploy.sh

echo
echo "finished."
