class DropColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :tweets, :reply_id
  end
end
