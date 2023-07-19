# frozen_string_literal: true

module RoleModelSower
  extend ActiveSupport::Autoload

  eager_autoload do
    autoload :Adapters
    autoload :Base
  end

  # CONFIGURATION OPTIONS

  # Available adapters: :yaml, :csv, :tsv, :json
  mattr_accessor :adapter
  @@adapter = :yaml

  def self.setup
    yield self
  end

  # END CONFIGURATION OPTIONS

  def self.seed!(*seed_names)
    seed_names.each do |seed_name|
      logger = Logger.new($stdout)
      pluralized_name = seed_name.to_s.classify
      logger.info "Seeding #{pluralized_name}..." if Rails.env.development?
      "RoleModelSower::Adapters::#{adapter.to_s.upcase}".constantize.all(seed_name).each(&:load!)
      logger.info "Seeding #{pluralized_name}... done" if Rails.env.development?
    end
  end
end
