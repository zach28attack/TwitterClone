class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_many :likes, as: :likeable
  validates :body, length: { maximum: 240 }, allow_blank: false
end
