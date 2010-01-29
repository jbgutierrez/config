require 'rubygems'

# Prompt behavior
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

# History
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:AUTO_INDENT]=true

#http://giantrobots.thoughtbot.com/2008/12/23/script-console-tips
require 'wirble'
Wirble.init
Wirble.colorize

# Autocomplete
# require 'map_by_method'
require 'what_methods'
require 'pp'

# print SQL to STDOUT
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  require 'hirb'
  Hirb::View.enable
end

class Object
  
  def local_methods
    (methods - Object.instance_methods).sort
  end
  
  def dump_history
    Readline::HISTORY.entries.split("exit").last[0..-2].join("\n") 
  end
  
  private
  
  def puts_ri_documentation_for(obj, meth)
    case self
    when Module
      candidates = ancestors.map{|klass| "#{klass}::#{meth}"}
      candidates.concat(class << self; ancestors end.map{|k| "#{k}##{meth}"})
    else
      candidates = self.class.ancestors.map{|klass|  "#{klass}##{meth}"}
    end
    candidates.each do |candidate|
      #puts "TRYING #{candidate}"
      desc = `qri '#{candidate}'`
      unless desc.chomp == "nil"
      # uncomment to use ri (and some patience)
      #desc = `ri -T '#{candidate}' 2>/dev/null`
      #unless desc.empty?
        puts desc
        return true
      end
    end
    false
  end

  def method_missing(meth, *args, &block)
    if md = /ri_(.*)/.match(meth.to_s)
      unless puts_ri_documentation_for(self,md[1])
        "Ri doesn't know about ##{meth}"
      end
    else
      super
    end
  end

  def ri_(meth)
    unless puts_ri_documentation_for(self,meth.to_s)
      "Ri doesn't know about ##{meth}"
    end
  end
end

alias q exit