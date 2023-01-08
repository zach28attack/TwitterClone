class AddUserIdToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :photos, :user_id, :integer
  end
end
