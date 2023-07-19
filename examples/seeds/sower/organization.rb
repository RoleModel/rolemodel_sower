# frozen_string_literal: true

module Sower
  class Organization < Sower::Base
    def load!
      ::Organization.find_or_create_by! name: @data[:name]
    end
  end
end
