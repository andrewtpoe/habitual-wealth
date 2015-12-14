class Profile < ActiveRecord::Base
  has_many :users
  has_many :budgets

  validates_associated :users
  validates :name, presence: true
  
end
