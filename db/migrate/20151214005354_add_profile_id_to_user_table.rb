class AddProfileIdToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :profile_id, :integer, null: false
  end
end
