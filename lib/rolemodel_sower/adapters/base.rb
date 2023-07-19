# frozen_string_literal: true

module RoleModelSower
  module Adapters
    class Base
      def self.file_extension
        raise NotImplementedError
      end

      def self.load_data(seed_name)
        raise NotImplementedError
      end

      def self.path(seed_name)
        Rails.root.join("db/sower_data/#{seed_name.to_s.pluralize}#{file_extension}")
      end

      def self.class_name(seed_name)
        "Sower::#{seed_name.to_s.classify}".constantize
      end

      def self.all(seed_name)
        load_data(seed_name).map do |template|
          data = ActiveSupport::HashWithIndifferentAccess.new(template)
          class_name(seed_name).new(data)
        end
      end
    end
  end
end
