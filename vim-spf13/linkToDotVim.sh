#!/bin/bash

rm ~/.vimrc.local
rm ~/.vimrc.before.local
rm ~/.vimrc.bundles.local

THIS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln $THIS/vimrc.local ~/.vimrc.local
ln $THIS/vimrc.before.local ~/.vimrc.before.local
ln $THIS/vimrc.bundles.local ~/.vimrc.bundles.local

vim +BundleInstall +BundleClean

