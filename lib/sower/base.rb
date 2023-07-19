# frozen_string_literal: true

module Sower
  class Base
    def initialize(data)
      @data = data
    end

    def load!
      raise NotImplementedError
    end
  end
end
