# == Schema Information
#
# Table name: books
#
#  id                :bigint(8)        not null, primary key
#  title             :string
#  description       :text
#  isbn              :string
#  visibility_status :boolean          default(TRUE)
#  date_of_creation  :date
#  sorting           :integer
#  publisher_id      :bigint(8)
#  author_id         :bigint(8)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :author

  validates :isbn, :title, presence: true, uniqueness: true

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
