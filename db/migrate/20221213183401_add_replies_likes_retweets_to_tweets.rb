class AddRepliesLikesRetweetsToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :likes, :integer
    add_column :tweets, :replies, :text
  end
end
