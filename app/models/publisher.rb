# == Schema Information
#
# Table name: publishers
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  telephone  :string
#  address    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Publisher < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :authors, through: :books

end
