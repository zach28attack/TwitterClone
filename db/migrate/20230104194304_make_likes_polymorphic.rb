class MakeLikesPolymorphic < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :tweet_id, :likeable_id
    add_column :likes, :likable_type, :string

    remove_index :likes, [:user_id, :likable_id]
    add_index :likes, [:user_id, :likeable_id, :likable_type], unique: true
    add_index :likes, [:likeable_id, :likable_type]
    remove_column :tweets, :likes
    remove_column :tweets, :title
  end
end
