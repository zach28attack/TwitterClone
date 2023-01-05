class Tweet < ApplicationRecord

  belongs_to :user
  belongs_to :tweet, optional: true
  has_many :comments
  has_many :likes, as: :likeable

  validates :body, length: { maximum: 240 }, allow_blank: false, unless: :tweet_id

  def tweet_type #add quote tweet functionality
    if tweet_id? && body?
      "quote-tweet"
    elsif tweet_id?
      "retweet"
    else
      "tweet"
    end

  end
end
