require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  config.gem 'rails', :version => '2.2.2'
  config.gem 'mojombo-grit', :source => 'http://gems.github.com', :lib => 'grit'
  config.gem 'haml', :version => '2.0.4'

  config.plugins = [ :all ]

  config.time_zone = 'UTC'
  config.action_controller.session = false
end
