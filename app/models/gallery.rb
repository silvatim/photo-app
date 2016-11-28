# == Schema Information
#
# Table name: galleries
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  visibility  :boolean
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Gallery < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :photos
end
