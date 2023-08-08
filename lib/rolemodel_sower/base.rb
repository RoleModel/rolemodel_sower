# frozen_string_literal: true

module RolemodelSower
  class Base
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def load!
      raise NotImplementedError
    end
  end
end
