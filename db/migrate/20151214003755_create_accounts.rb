class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :budget_id, null: false
      t.string :name, null: false
      t.string :type, null: false
      t.string :institution, null: false
      
      t.timestamps null: false
    end
  end
end
