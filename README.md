# Sower

A Ruby gem to simplify Seed data creation for Rails applications.

## Installation

Add it to your Gemfile:

```ruby
gem 'rolemodel_sower'
```

Run the following command to install it:

```console
bundle install
```

Run the generator:

```console
rails generate rolemodel_sower:install
```

## Usage

### Creating Seed Data

Seed data is created by placing files in the `db/rolemodel_sower_data` directory. The files should be named after the model they are creating data for. For example, a file named `users.json` would create seed data for the `User` model.

`db/rolemodel_sower_data/users.json`

The seed data directory can be configured in the initializer generated by the install generator.

```ruby
RolemodelSower.setup do |config|
  config.data_path = 'db/seed_data'
end
```

### Translating Seed Data

You will need to define a rolemodel_sower file to take the data parsed from your seed data and create the records in your database.

Sower files should be created in `app/seeds/rolemodel_sower`. The files should be named after the model they are creating data for. For example, a file named `user.rb` would create seed data for the `User` model.

In `db/rolemodel_sower_data/users.json`
```json
[
  {
    "first_name": "John",
    "last_name": "Doe",
    "email": "john.doe@example.com"
  },
  {
    "first_name": "Jane",
    "last_name": "Doe",
    "email": "jane.doe@example.com"
  }
]
```

In `app/seeds/rolemodel_sower/user.rb`
```ruby
# frozen_string_literal: true

module RolemodelSower
  class User < RolemodelSower::Base
    def load!
      ::User.find_or_create_by!(
        first_name: data[:first_name],
        last_name: data[:last_name],
        email: data[:last_name]
      )
    end
  end
end
```

### Loading Seed Data

Seeds can be generated by calling the `seed!` method on `RolemodelSower`.

It takes one or more symbol arguments that correspond to sets of seed data and runs them in the order passed.

`RolemodelSower.seed!(:users, :organizations, :facilities)`

If you want to add conditions to each run, you can separate out each call to seed.

```ruby
RolemodelSower.seed!(:users) if my_condition
RolemodelSower.seed!(:organizations) if other_condition
RolemodelSower.seed!(:facilities) if another_condition
```

## Adapters

RolemodelSower defaults to loading yml files, but can be configured to load json, csv, or tsv files. This can be configured in `config/initializers/rolemodel_sower.rb`. (Can be generated by running `rails generate rolemodel_sower:install`)

```ruby
RolemodelSower.setup do |config|
  config.adapter = :json
end
```

## Development

To build the gem locally, run: `gem build rolemodel_sower.gemspec`

To test the gem locally, use the path option in your Gemfile:

```ruby
gem 'rolemodel_sower', path: '../rolemodel_sower'
```

## Publishing

Make sure you are an owner of the gem.

You also need to be signed in to rubygmes by running:

`gem signin`

To publish, run:

`gem push rolemodel_sower-{major.minor.patch}.gem`
