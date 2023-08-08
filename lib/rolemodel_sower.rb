# frozen_string_literal: true

module RolemodelSower
  extend ActiveSupport::Autoload

  eager_autoload do
    autoload :Adapters
    autoload :Base
  end

  # CONFIGURATION OPTIONS

  # Available adapters: :yaml, :csv, :tsv, :json
  mattr_accessor :adapter
  @@adapter = :yaml

  mattr_accessor :data_path
  @@data_path = 'db/rolemodel_sower_data'

  def self.setup
    yield self
  end

  # END CONFIGURATION OPTIONS

  def self.seed!(*seed_names)
    seed_names.each do |seed_name|
      current_seed_name = seed_name.try(:keys)&.first || seed_name
      current_adapter = seed_name.try(:values)&.first || adapter
      pluralized_name = current_seed_name.to_s.classify

      logger = Logger.new($stdout)
      logger.info "Seeding #{pluralized_name}..." if Rails.env.development?

      "RolemodelSower::Adapters::#{current_adapter.to_s.upcase}".constantize.all(current_seed_name).each(&:load!)

      logger.info "Seeding #{pluralized_name}... done" if Rails.env.development?
    end
  end
end
