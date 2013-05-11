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
                  :name, 
                  :twitter_url, 
                  :url_hash

  acts_as_birthday :date_born

  validates_presence_of :date_born, :name, :url_hash
  validates_uniqueness_of :url_hash

  def set_twitter_handle
    twitter_account = self.twitter_url
    if twitter_account.include?('twitter.com')
      handle = twitter_account[/twitter\.com\/([a-zA-Z_]+)/,1]
    elsif twitter_account.include?('@')
      handle = twitter_account.sub('@', '')
    else
      handle = twitter_account
    end
    self.twitter_url = handle
  end

  def twitter_message
    if self.twitter_url.present?
      "IS IT @#{self.twitter_url} #BIRFDAY?"
    else
      "IS IT #{self.name.upcase}'s #BIRFDAY?"
    end
  end
end
