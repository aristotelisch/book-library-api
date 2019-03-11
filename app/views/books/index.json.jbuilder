# frozen_string_literal: true

json.books @books do |book|

  json.id book.id
  json.title book.title
  json.truncated_description book.truncated_description
  json.isbn book.isbn
  json.date_of_creation book.formatted_date_of_creation

  json.author do
    json.id book.author.id
    json.full_name book.author.full_name
  end

end
