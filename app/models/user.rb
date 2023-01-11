class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :username, uniqueness: {case_sensitive: false}
  validates_length_of :username, in: 3..15

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :photos, class_name: "Photo", dependent: :destroy
end
