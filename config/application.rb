require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'devise'
Bundler.require(*Rails.groups)

module Bugzilla
  class Application < Rails::Application
    config.autoload_paths += %W( #{Rails.root}/lib)

    COPYRIGHT_YEAR = '2014'
    COPYRIGHT_AUTHOR = 'Andrzej Trzaska'
    ITEMS_PER_PAGE = 8
  end
end
