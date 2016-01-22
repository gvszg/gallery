# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  website_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Photo < ActiveRecord::Base
  belongs_to :website
end
