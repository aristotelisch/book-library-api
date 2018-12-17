5.times do
  publisher = Publisher.new
  publisher.name = Faker::Book.publisher
  publisher.address = Faker::Address.full_address
  publisher.telephone = Faker::PhoneNumber.phone_number
  publisher.save

  10.times do
    author = Author.new
    author.first_name = Faker::Name.first_name
    author.last_name = Faker::Name.last_name
    author.email = Faker::Internet.email
    author.date_of_birth = Faker::Date.between(60.years.ago, 20.year.ago)
    author.save

    (1..20).each do |i|
      book = Book.new
      book.title = Faker::Book.title
      book.description = Faker::Lorem.paragraph(sentence_count = 4)
      book.isbn = Faker::Code.isbn
      book.visibility_status = true
      book.date_of_creation = Faker::Date.between(5.years.ago, 1.month.ago)
      book.sorting = i
      book.publisher = publisher
      book.author = author
      book.save

    end
  end

end