# frozen_string_literal: true

module Sower
  class User < Sower::Base
    def load!
      user = ::User.create_with(
        first_name: @data[:first_name],
        last_name: @data[:last_name],
        password: @data[:password],
        password_confirmation: @data[:password],
        organization: ::Organization.first,
      ).find_or_create_by! email: @data[:email]

      # Any models can be affected here.
      ::Profile.find_or_create_by!(user: user)
    end
  end
end
