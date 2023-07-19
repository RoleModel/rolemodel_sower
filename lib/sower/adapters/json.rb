# frozen_string_literal: true

require 'json'

module Sower
  module Adapters
    class JSON < Base
      def self.file_extension
        '.json'
      end

      def self.load_data(seed_name)
        ::JSON.parse(path(seed_name).read)
      end
    end
  end
end
