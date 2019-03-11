json.authors @authors do |author|
  json.id author.id
  json.full_name author.full_name
  json.email author.email
  json.date_of_birth author.formatted_date_of_birth

  json.books author.books do |book|
    book = BookDecorator.new(book)

    json.id book.id
    json.title book.title
    json.description book.description
    json.isbn book.isbn
    json.visibility_status book.visibility_status
    json.date_of_creation book.formatted_date_of_creation
    json.sorting book.sorting
    json.publisher_id book.publisher.id
    json.author_id book.author.id
    json.created_at book.created_at
    json.updated_at book.updated_at
  end
end
