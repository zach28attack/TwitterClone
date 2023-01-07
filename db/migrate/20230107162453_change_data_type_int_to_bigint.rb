class ChangeDataTypeIntToBigint < ActiveRecord::Migration[7.0]
  def change
    change_table :comments do |t|
      t.change :tweet_id, :bigint
      t.change :user_id, :bigint
    end

    change_table :likes do |t|
      t.change :likeable_id, :bigint
      t.change :user_id, :bigint
    end

    change_table :tweets do |t|
      t.change :tweet_id, :bigint
      t.change :user_id, :bigint
    end
  end
end
