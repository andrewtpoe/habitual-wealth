class User < ActiveRecord::Base
  belongs_to :profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :encrypted_password, :profile_id, presence: true
  validates :email, uniqueness: true
  validates :profile_id, numericality: true

end
