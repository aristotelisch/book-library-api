class Author < ApplicationRecord
  has_many :books
  has_many :publishers, through: :books

  def full_name
    "#{first_name} #{last_name}"
  end
end
