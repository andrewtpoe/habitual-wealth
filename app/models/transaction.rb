class Transaction < ActiveRecord::Base
  belongs_to :accounts
  belongs_to :categories

  validates_associated :accounts
  validates :debit_account_id, :credit_account_id, :type, :payee, :amount, :date, :cleared, presence: true
end
