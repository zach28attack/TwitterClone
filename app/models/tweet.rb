class Tweet < ApplicationRecord
  validates :title, presence: true, length:{minimum: 5, maximum:500}
  
end
