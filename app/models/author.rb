# == Schema Information
#
# Table name: authors
#
#  id            :bigint(8)        not null, primary key
#  first_name    :string
#  last_name     :string
#  email         :string
#  date_of_birth :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :publishers, through: :books

  validates :email, uniqueness: true, presence: true,
                    format: {
                      with: URI::MailTo::EMAIL_REGEXP,
                      message: 'Only valid emails allowed'
                    }
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
