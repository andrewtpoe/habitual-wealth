class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :account_id, null: false
      t.string :name, null: false
      t.string :note
      t.string :type, null: false
      t.integer :balance_at_bob, null: false
      t.integer :allocated_at_bob, null: false
      
      t.timestamps null: false
    end
  end
end
