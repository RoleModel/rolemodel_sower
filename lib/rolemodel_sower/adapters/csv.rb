# frozen_string_literal: true

require 'csv'

module RoleModelSower
  module Adapters
    class CSV < Base
      def self.file_extension
        '.csv'
      end

      def self.load_data(seed_name)
        ::CSV.read(path(seed_name), headers: true)
      end
    end
  end
end
