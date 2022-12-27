class Tweet < ApplicationRecord
  #validates :body, presence: true, length:{minimum: 5, maximum:500}
  belongs_to :user
  belongs_to :tweet, optional: true

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
