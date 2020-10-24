 #!/bin/bash

#For Ubuntu Linux

#NodeJS
sudo apt install nodejs -y

#Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt install yarn -y

#Vim
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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

colorscheme dracula
EOF

#CLI
sudo npm install -g @vue/cli eslint firebase-tools

#Arduino
sudo dnf install arduino

#Postman
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

#Git
sudo apt install git-all -y

#Tmux
sudo apt -y install tmux -y
cd ~
cat > .tmux.conf <<- "EOF"
# Send Prefix
set-option -g prefix C-a
unbind-key C-a
bind-key C-a send-prefix

# Use Alt-arrow keys to switch panes
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Shift arrow to switch windows
bind -n S-Left previous-window
bind -n S-Right next-window

# Mouse Mode
set -g mouse on

# Set easier window split keys
bind-key v split-window -h
bind-key h split-window -v

# Copy Paste
bind P paste-buffer
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi y send-keys -X copy-selection
bind-key -T copy-mode-vi r send-keys -X rectangle-toggle
EOF

#htop
sudo apt install htop -y

#Keybase
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install ./keybase_amd64.deb
run_keybase

#Build-essentials
sudo apt install make automake gcc -y

#fzf
sudo apt install fzf -y

#NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash