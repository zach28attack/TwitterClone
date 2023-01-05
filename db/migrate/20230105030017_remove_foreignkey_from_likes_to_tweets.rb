class RemoveForeignkeyFromLikesToTweets < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :likes, :tweets
  end
end
