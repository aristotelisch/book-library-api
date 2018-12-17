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

require 'test_helper'

class PublisherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
