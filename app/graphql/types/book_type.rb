module Types
  class BookType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :description, String, null: true
    field :isbn, String, null: true
    field :visibility_status, Boolean, null: true
    field :author, Types::AuthorType, null: true
  end
end
