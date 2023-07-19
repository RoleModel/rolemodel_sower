# frozen_string_literal: true

module RoleModelSower
  module Adapters
    class YAML < Base
      def self.file_extension
        '.yml'
      end

      def self.load_data(seed_name)
        ::YAML.safe_load(ERB.new(path(seed_name).read).result)
      end
    end
  end
end
