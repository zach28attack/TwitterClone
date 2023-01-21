class Tweet < ApplicationRecord
  self.per_page = 6
  belongs_to :user
  belongs_to :tweet, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable

  validates :body, length: { maximum: 240 }, allow_blank: false, unless: :tweet_id

  def tweet_type 
    if tweet_id?
      "retweet"
    else
      "tweet"
    end

  end
end
