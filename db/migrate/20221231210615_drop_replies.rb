class DropReplies < ActiveRecord::Migration[7.0]
  def change
    drop_table :replies
  end
end
