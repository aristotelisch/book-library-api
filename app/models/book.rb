class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :author

  def truncated_description
    description.length > 100 ? description[0, 100] + '...' : description
  end

  def author_full_name
    author.full_name
  end

  def author_email
    author.email
  end

  def author_date_of_birth
      author.date_of_birth
  end

  def publisher_name
      publisher.name
  end

  def publisher_address
      publisher.address
  end
end
