class Account < ActiveRecord::Base
  belongs_to :budgets
  has_many :categories

  validates_associated :budget
  validates :budget_id, :name, :type, :institution, presence: true
  validates :type, inclusion: { in: ['income', 'expense', 'asset', 'foundational', 'investment'] }

end
