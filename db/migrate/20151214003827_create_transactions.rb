class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :debit_account_id, null: false
      t.integer :debit_category_id
      t.integer :credit_account_id, null: false
      t.integer :credit_category_id
      t.string :type, null: false
      t.string :payee, null: false
      t.integer :gross_amount
      t.integer :amount, null: false
      t.date :date, null: false
      t.string :description
      t.boolean :cleared, default: false, null: false

      t.timestamps null: false
    end
  end
end
