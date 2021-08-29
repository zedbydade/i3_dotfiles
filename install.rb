#!/usr/bin/env ruby
# frozen_string_literal: true

def print_cyan(text)
  puts "\e[36m#{text}\e[0m"
end

def print_green(text)
  puts "\e[32m#{text}\e[0m"
end

def print_red(text)
  puts "\e[31m#{text}\e[0m"
end

def path(filepath)
  File.expand_path(filepath)
end

print_cyan 'Checkin if vim-plug exists...'
if File.exist? path('~/.config/nvim/autoload/plug.vim')
  print_green 'You already have vim-plug, awesome!'
else
  print_red 'Nope, installing vim-plug'
  `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
end

print_cyan 'Checking if zsh is installed'
if `which zsh`.include? 'not found'
  print_red 'Nope, installing zsh'
  `sudo pacman -S zsh`
  `sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`
else
  print_green 'You already have zsh, awesome!'
end

print_cyan 'Copying neovim configs to ~/.config/nvim'
`cp -r nvim ~/.config/nvim`

print_cyan 'Copying tmux configs to ~/.config/tmux'
`cp -r tmux ~/.config/tmux`

print_cyan 'Copying i3 configs to ~/.config/i3'
`cp -r i3 ~/.config/i3`

print_cyan 'Copying i3status configs to ~/.config/i3status'
`cp -r i3status ~/.config/i3status`
