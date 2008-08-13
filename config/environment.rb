RAILS_GEM_VERSION = '2.1.0' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|    
  config.gem 'SyslogLogger', :lib => 'syslog_logger'
  
  config.time_zone = 'UTC'
  config.action_controller.session = {
    :session_key => '_htg_site_session',
    :secret => (RAILS_ENV == 'production') ? File.read(File.join(File.dirname(__FILE__), 'cookie_secret')) : '67d6b42da8bad003ea30ae1802930bcbb1c0a808c1dcd3c3c9070fb1c297a90a59df7f38a05860354b05d6370541cc56f2972532f78e9baac63976c0819abc20'
  }
end
