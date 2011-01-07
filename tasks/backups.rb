# gem install whenever astrails-safe

home     = ENV["HOME"]
projects = ENV["PROJECTS_FOLDER"]

safe do
  local :path => "#{home}/Dropbox/Backups/:id"

  keep do
    local 2
  end

  tar do
    options "-h" # dereference symlinks
    archive "projects" do
      files projects
      # exclude "#{projects}/@*"
      # exclude "#{projects}/*/log"
      # exclude "#{projects}/*/tmp"
      # exclude "#{projects}/@*"
      exclude "**/log"
      exclude "**/tmp"
    end
  end
end
