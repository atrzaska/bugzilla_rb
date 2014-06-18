require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'devise'

Bundler.require(*Rails.groups)

module Bugzilla
  class Application < Rails::Application
    COPYRIGHT_YEAR = '2014'
    COPYRIGHT_AUTHOR = 'Andrzej Trzaska'
  end
end
