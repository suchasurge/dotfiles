require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['other/*', 'zsh/*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file
    
    relative_path = file.sub(/other\/|zsh\//, '')
    
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{relative_path.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(relative_path)
        when 'y'
          replace_file(relative_path)
        when 'q'
          exit
        else
          puts "skipping ~/.#{relative_path.sub('.erb', '')}"
        end
      end
    else
      link_file(relative_path)
    end
  end
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read("other/#{file}")).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end
