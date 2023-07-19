# frozen_string_literal: true

require 'csv'

module RoleModelSower
  module Adapters
    class TSV < Base
      def self.file_extension
        '.tsv'
      end

      def self.load_data(seed_name)
        ::CSV.read(path(seed_name), headers: true, col_sep: "\t")
      end
    end
  end
end
