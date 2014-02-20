#!/bin/bash

# install spf13
curl http://j.mp/spf13-vim3 -L -o - | sh

rm ~/.vimrc.local
rm ~/.vimrc.before.local
rm ~/.vimrc.bundles.local

# copy modifying files
THIS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln $THIS/vimrc.local ~/.vimrc.local
ln $THIS/vimrc.before.local ~/.vimrc.before.local
ln $THIS/vimrc.bundles.local ~/.vimrc.bundles.local

# update vim
vim +BundleInstall +BundleClean

