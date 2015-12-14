class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :profile_id, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :month, null: false
      t.string :year, null: false

      t.timestamps null: false
    end
  end
end
