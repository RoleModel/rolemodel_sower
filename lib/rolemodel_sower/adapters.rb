# frozen_string_literal: true

module RoleModelSower
  module Adapters
    extend ActiveSupport::Autoload

    autoload :Base
    autoload :CSV
    autoload :JSON
    autoload :TSV
    autoload :YAML
  end
end
