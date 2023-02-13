class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  attr_accessor :current_password 

  validates :name, presence: true
  validates :username, uniqueness: {case_sensitive: false}
  validates_length_of :username, in: 3..15

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :photos, class_name: "Photo", dependent: :destroy
  
  has_many :follows
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  # Set ransackable attributes for ransack gem.
  # Allows attributes of a model and their allowed associations to be retrievable
  def self.ransackable_attributes(auth_object = nil)
    ["name", "username"]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
