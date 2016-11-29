# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  location    :text
#  category_id :integer
#  image       :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Photo < ActiveRecord::Base
  acts_as_taggable
  has_and_belongs_to_many :galleries
  belongs_to :user
  belongs_to :category
end


