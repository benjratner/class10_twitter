class AddAttributesToTweets < ActiveRecord::Migration
  def change
  	add_column :tweets, :username, :text
  	add_column :tweets, :content, :text
  end
end
