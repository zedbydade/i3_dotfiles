#!/usr/bin/env ruby

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

print_cyan "Checkin if vim-plug exists..."
if File.exists? path("~/.config/nvim/autoload/plug.vim")
  print_green "You already have vim-plug, awesome!"
else
  print_red "Nope, installing vim-plug"
    `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
end

print_cyan "Checking if zsh is installed"
if `which zsh`.include? "not found"
  print_red "Nope, installing zsh"
  `sudo apt-get install zsh`
  `sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`
else
  print_green "You already have zsh, awesome!"
end

print_cyan "Copying .vimrc to ~/.vimrc"
`cp -i init.vim ~/.config/nvim/init.vim`

if File.readlines(path("~/.zshrc")).grep(/zsh-aliases/).size == 0
  print_cyan "Adding .zsh-aliases to ~/.zshrc"
  `echo "source ~/.zsh-aliases" >> ~/.zshrc`
end

