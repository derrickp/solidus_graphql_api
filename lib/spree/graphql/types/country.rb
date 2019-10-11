# frozen_string_literal: true

module Spree
  module Graphql
    module Types
      class Country < Base::RelayNode
        description 'Country.'

        field :iso_name, String, null: false
        field :iso, String, null: false
        field :iso3, String, null: false
        field :name, String, null: false
        field :numcode, Integer, null: false
        field :states, Types::State.connection_type, null: false
        field :states_required, Boolean, null: false
        field :created_at, GraphQL::Types::ISO8601DateTime, null: true
        field :updated_at, GraphQL::Types::ISO8601DateTime, null: true

        def states
          Spree::Queries::Country::StatesQuery.new(country: object).call
        end
      end
    end
  end
end
