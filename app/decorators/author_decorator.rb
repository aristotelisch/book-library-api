class AuthorDecorator < SimpleDelegator

  def self.wrap(collection)
    collection.map(&method(:new))
  end

  def formatted_date_of_birth
    date_of_birth.strftime('%m of %B %Y')
  end
end