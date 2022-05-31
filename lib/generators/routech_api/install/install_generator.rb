# frozen_string_literal: true

module RoutechApi
  # InstallGenerator Class
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def copy_files
      template 'routech_api.rb', File.join('config', 'initializers', 'routech_api.rb')
    end
  end
end
