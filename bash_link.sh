mkdir ~/old.vim.copy
mv ~/.vim* ~/old.vim.copy
ln -sf `pwd -P`/.vim	~/.vim
ln -sf `pwd -P`/.vimrc ~/.vimrc
ln -sf `pwd -P`/.vimrc.before	~/.vimrc.before
ln -sf `pwd -P`/.vimrc.bundles ~/.vimrc.bundles
ln -sf `pwd -P`/.vimrc.local	~/.vimrc.local
