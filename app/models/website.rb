# == Schema Information
#
# Table name: websites
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Website < ActiveRecord::Base
  has_many :photos
end