every 1.day, :at => '3am' do
  command "astrails-safe #{ENV['hOME']}/bin/tasks/backups.rb"
end

every [:tuesday, :saturday], :at => '1am' do
  command "#{ENV['HOME']}/bin/tasks/esl_tasks.rb update_notes"
end

every 10.minutes do
  command 'curl http://jbgutierrez.info >> /dev/null'
end
