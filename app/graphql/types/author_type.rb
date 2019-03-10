module Types
  class AuthorType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :full_name, String, null: true
    field :email, String, null: true
  end
end
