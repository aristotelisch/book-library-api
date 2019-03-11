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

end
