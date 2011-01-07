every 1.day, :at => '3am' do
  command "astrails-safe #{ENV['hOME']}/bin/tasks/backups.rb"
end

every 10.minutes do
  command 'curl http://jbgutierrez.info >> /dev/null'
end
