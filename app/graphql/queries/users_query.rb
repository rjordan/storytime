module Queries
  # List all films
  module UsersQuery
    def self.included(base)
      base.class_eval do
        field :users, Types::UserType.connection_type, description: "List of users", null: false
      end
    end

    def users
      User.all
    end
  end
end
