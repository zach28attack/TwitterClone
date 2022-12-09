class Tweet < ApplicationRecord
  validates :body, presence: true, length:{minimum: 5, maximum:500}
  belongs_to :user
end
