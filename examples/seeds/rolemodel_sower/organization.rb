# frozen_string_literal: true

module RolemodelSower
  class Organization < RolemodelSower::Base
    def load!
      ::Organization.find_or_create_by! name: @data[:name]
    end
  end
end
