# frozen_string_literal: true

module RolemodelSower
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Copy RolemodelSower default files'
      source_root File.expand_path('templates', __dir__)

      def copy_config
        template 'config/initializers/rolemodel_sower.rb'
      end
    end
  end
end
