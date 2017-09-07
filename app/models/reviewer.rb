class Reviewer < ApplicationRecord

  # Alternate syntax:
  # has_many :reviews, -> { extending(Review::Spamify).extending(Review::Publish) }
  has_many :reviews, extend: [Review::Spamify, Review::Publish]

end
