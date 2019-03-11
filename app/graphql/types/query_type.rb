module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    #

    field :books, [Types::BookType], null: false,
      description: "All available books" do

      argument :id, ID, "Restrict books to id", required: false
    end

    def books(id: nil)
      if id
        Book.includes(:author).where(id: id)
      else
        Book.includes(:author).all
      end
    end

    def self.visible?(context)
      # check if user should access this endpoint
    end

  end
end
