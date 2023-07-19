# frozen_string_literal: true

module Sower
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Copy Sower default files'
      source_root File.expand_path('templates', __dir__)

      def copy_config
        template 'config/initializers/sower.rb'
      end
    end
  end
end
