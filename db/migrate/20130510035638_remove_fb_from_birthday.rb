class RemoveFbFromBirthday < ActiveRecord::Migration
  def change
    remove_column :birthdays, :fb_url
  end
end
