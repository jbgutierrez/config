require 'rake'
require 'erb'
 
desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['dotfiles/*'].each do |file|
    hidden_file = File.join(ENV['HOME'], "." + file.gsub('dotfiles/', ''))
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
end
 
def replace_file(file, hidden_file)
  `rm "#{hidden_file}"`
  link_file(file, hidden_file)
end
 
def link_file(file, hidden_file)
  puts "linking #{hidden_file}"
  `ln -s "#{ENV['PWD']}/#{file}" "#{hidden_file}"`
end