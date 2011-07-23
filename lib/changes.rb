require "changes/version"

module Changes
  require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'record_changes/base'
end
