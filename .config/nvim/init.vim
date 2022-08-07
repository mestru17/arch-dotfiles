" Neovim has a lot of settings set by default (see :help nvim-defaults).
" These settings will also implicitly apply when using this init.vim - i.e.
" this config file will not un-set or change any default settings unless
" explicitly specified. As such, there is no reason to enable autoindent here,
" for instance, as it is already enabled by default.

" Turn on both normal and relative line numbers
set relativenumber
set number

" Copy to and paste from system clipboard
set clipboard+=unnamedplus
