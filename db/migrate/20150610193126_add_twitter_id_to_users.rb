class AddTwitterIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_nickname, :string
    add_column :users, :twitter_id, :string
  end
end
