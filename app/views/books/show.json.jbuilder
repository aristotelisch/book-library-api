json.book do
  json.id @book.id
  json.title @book.title
  json.description @book.description
  json.isbn @book.isbn
  json.date_of_creation @book.formatted_date_of_creation

  json.author do
    author = AuthorDecorator.new(@book.author)

    json.id author.id
    json.full_name author.full_name
    json.email author.email
    json.date_of_birth author.formatted_date_of_birth

  end

  json.publisher do
    json.name @book.publisher.name
    json.address @book.publisher.address
  end
end
