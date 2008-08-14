config.cache_classes = true
config.logger = SyslogLogger.new('rails_site')
config.logger.level = Logger::WARN

config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true
config.action_view.cache_template_loading            = true