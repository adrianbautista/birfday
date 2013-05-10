class CreateBirthdays < ActiveRecord::Migration
  def change
    create_table :birthdays do |t|
      t.string :url_hash
      t.string :fb_url
      t.string :twitter_url
      t.datetime :date_born
      t.string :name
      t.timestamps
    end
  end
end
