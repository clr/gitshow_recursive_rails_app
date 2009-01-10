require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
#  config.gem 'rails', :version => '2.2.2'
  config.gem 'mojombo-grit', :source => 'http://gems.github.com', :lib => 'grit'
#  config.gem 'haml', :version => '2.0.4'

  config.plugins = [ :all ]

  config.time_zone = 'UTC'
  config.action_controller.session = false
end

module Grit

  class Commit
    
    # These comparisons are particularly important in the specs.
    def ==( object )
      ( object.respond_to?( :id ) && object.id == self.id )
    end
    alias_method 'eql?', '=='

  end

  class Blob
    
    # These comparisons are particularly important in the specs.
    def ==( object )
      ( object.respond_to?( :id ) && object.id == self.id )
    end
    alias_method 'eql?', '=='

  end

  class Diff
    
    # These comparisons are particularly important in the specs.
    def ==( object )
      ( object.respond_to?( :a_commit ) &&
        object.respond_to?( :b_commit ) &&
        ( object.a_commit == self.a_commit ) &&
        ( object.b_commit == self.b_commit ) )
    end
    alias_method 'eql?', '=='

  end

end
