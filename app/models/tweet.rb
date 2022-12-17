class Tweet < ApplicationRecord
  #validates :body, presence: true, length:{minimum: 5, maximum:500}
  belongs_to :user
  belongs_to :tweet, optional: true

  def tweet_type
    if tweet_id? && body?
      "quote-tweet"
    elsif tweet_id?
      "retweet"
    else
      "tweet"
    end

  end
end
