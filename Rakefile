require 'rake'

task :default => :install

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  files=`git ls-tree head --name-only`.split(/\n/)
  files.each do |file|
    next if file =~ /^\.|Rakefile|README|osx/
    hidden_file = File.join(ENV['HOME'], "." + file)
    if File.exist?(hidden_file)
      if File.identical? file, hidden_file
        puts "identical #{hidden_file}"
      elsif replace_all
        replace_file(file, hidden_file)
      else
        print "overwrite #{hidden_file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file, hidden_file)
        when 'y'
          replace_file(file, hidden_file)
        when 'q'
          exit
        else
          puts "skipping #{hidden_file}"
        end
      end
    else
      link_file(file, hidden_file)
    end
  end
  download_submodules
  link_neovim_files
  link_sublime_folder
end

def replace_file(file, hidden_file)
  `rm "#{hidden_file}"`
  link_file(file, hidden_file)
end

def link_file(file, hidden_file)
  puts "linking #{hidden_file}"
  `ln -fs "#{ENV['PWD']}/#{file}" "#{hidden_file}"`
end

def link_sublime_folder
  link_file 'sublime', '$HOME/Library/Application Support/Sublime Text 2/Packages/User'
end

def download_submodules
  `git submodule init`
  `git submodule update`
end

def link_neovim_files
  `mkdir -p $HOME/.config`
  `ln -fs ~/.vim $HOME/.config/nvim`
  `ln -fs ~/.vimrc $HOME/.config/nvim/init.vim`
  `ln -fs ~/.vimrc.local $HOME/.config/nvim/init.vim.local`
end
