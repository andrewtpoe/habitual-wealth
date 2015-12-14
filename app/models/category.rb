class Category < ActiveRecord::Base
  belongs_to :account
  has_many :transactions

  validates_associated :account
  validates :account_id, :name, :type, :balance_at_bob, :allocated_at_bob, presence: true
  validates :account_id, :balance_at_bob, :allocated_at_bob, numericality: true

end
