# == Schema Information
#
# Table name: birthdays
#
#  id          :integer          not null, primary key
#  url_hash    :string(255)
#  fb_url      :string(255)
#  twitter_url :string(255)
#  date_born   :datetime
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Birthday < ActiveRecord::Base
  extend FriendlyId
  friendly_id :url_hash

  attr_accessible :date_born, 
                  :fb_url, 
                  :name, 
                  :twitter_url, 
                  :url_hash

  acts_as_birthday :date_born

  validates_presence_of :date_born, :name, :url_hash
  validates_uniqueness_of :url_hash
end
