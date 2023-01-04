class FixLikeableTypo < ActiveRecord::Migration[7.0]
  def change
    remove_index :likes, [:user_id, :likeable_id, :likable_type]
    remove_index :likes, [:likeable_id, :likable_type]
    rename_column :likes, :likable_type, :likeable_type

  end
end
