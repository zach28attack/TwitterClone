class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets 
  has_many :comments
  has_many :likes

  validates :username, uniqueness: {case_sensitive: false}
  validates_length_of :username, in: 3..15
end
