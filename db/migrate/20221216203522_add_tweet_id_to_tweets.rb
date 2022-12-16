class AddTweetIdToTweets < ActiveRecord::Migration[7.0]
  def change
    remove_column :tweets, :replies
    add_column :tweets, :tweet_id, :integer
  end
end
