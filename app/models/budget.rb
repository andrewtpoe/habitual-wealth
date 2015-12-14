class Budget < ActiveRecord::Base
  belongs_to :profile
  has_many :accounts

  validates_associated :profile
  validates :profile_id, :start_date, :end_date, :month, :year, presence: true
  validates :month, inclusion: { in: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'] }

end
