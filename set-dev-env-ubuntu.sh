#!/bin/bash

# For Ubuntu Linux

# Make sure we are on the root
cd ~

# NodeJS
sudo apt install nodejs -y

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt install yarn -y

# Vim
sudo apt install vim -y
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/myusuf3/numbers.vim.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/dracula/vim.git dracula
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/heavenshell/vim-jsdoc.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/kchmck/vim-coffee-script.git
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/lepture/vim-css.git
git clone https://github.com/posva/vim-vue.git
git clone https://github.com/tomlion/vim-solidity.git
git clone https://github.com/leafgarland/typescript-vim.git

cd ~

cat > .vimrc <<- "EOF"
execute pathogen#infect()
syntax enable
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
set autoindent
set clipboard=unnamedplus "yank across terminals
autocmd BufWritePre * :%s/\s\+$//e " remove whitespaces on save

nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

:set colorcolumn=100

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

colorscheme dracula
EOF

# CLI
sudo npm install -g @vue/cli eslint firebase-tools

# Arduino
sudo dnf install arduino

# Postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman-linux-x64.tar.gz
sudo tar xvzf postman-linux-x64.tar.gz -C /opt
sudo ln -s /opt/Postman/Postman /usr/bin/postman

cat << EOF > ~/.local/share/applications/postman2.desktop
[Desktop Entry]
Name=Postman
GenericName=API Client
X-GNOME-FullName=Postman API Client
Comment=Make and view REST API calls and responses
Keywords=api;
Exec=/opt/Postman/Postman
Terminal=false
Type=Application
Icon=/opt/Postman/app/resources/app/assets/icon.png
Categories=Development;Utilities;
EOF

# Git
sudo apt install git-all -y

# Tmux
sudo apt -y install tmux -y
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cat > .tmux.conf <<- "EOF"
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'

# Free the original Ctrl-b prefix keybinding
unbind-key C-b

# Setting the prefix to Ctrl-a
set-option -g prefix C-a

# Send Prefix
bind-key C-a send-prefix

#setting the delay between prefix and command
set -s escape-time 5

# Set bind key to reload configuration file
# prefix + r
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# Use Alt-arrow keys to switch panes
# Alt + Directional arrow
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Shift arrow to switch windows
# Shift + Directional arrow
bind -n S-Left previous-window
bind -n S-Right next-window

# Mouse Mode
set -g mouse on

# Set easier window split keys
# prefix + v for vertical
# prefix + h for horizontal
bind-key v split-window -v
bind-key h split-window -h

# Default to vi
set -g status-keys vi

# Copy Paste
# prefix + [ to enter copy mode

# Use mouse for copy mode
set-option -g mouse on
# Use vim keybindings in copy mode
setw -g mode-keys vi
set-option -s set-clipboard off
# prefix + P for paste
bind P paste-buffer
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi y send-keys -X rectangle-toggle
unbind -T copy-mode-vi Enter
bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel 'xclip -se c -i'
bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel 'xclip -se'

# Set the status line's colors
set -g status-style fg=white,bg=blue

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run -b '~/.tmux/plugins/tpm/tpm'
EOF

# htop
sudo apt install htop -y

# Build-essentials
sudo apt install make automake gcc -y

# fzf
sudo apt install fzf -y

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# TypeScript
npm install -g typescript

# Grip
pip install grip

# Cheat
pip install cheat

cd ~/.cheat
cat > tmux <<- "EOF"
# Tmux Cheatsheet

## Prefix

* CTRL + a

## Reload session

* prefix + r

## Switch Panes

* prefix + up arrow, prefix + down arrow, prefix + left arrow, prefix + right -> up, down, left, right

## Switch Windows

* prefix + left -> previous window
* prefix + right -> next window

## Split Terminal

* prefix + v -> vertical split
* prefix + h -> horizontal split

## Copy Paste

You can use Vim keybindings or mouse to copy

* prefix + [ -> copy mode
* prefix + P -> paste

## Plugins

### Install Plugins

* prefix + I

### Resurrect

* prefix + s -> save session
* prefix + r -> restore session
EOF

cd ~
