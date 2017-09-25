class Reviewer < ApplicationRecord

  # Alternate syntax:
  # has_many :reviews, -> { extending(Review::Spamify).extending(Review::Publish) }
  has_many :reviews, extend: [Review::Spamify, Review::Publish]

  # Can't use this syntax in certain joins
  #scope :very_recent, -> { where("created_at > ?", 1.hour.ago)}
  scope :very_recent, -> { where(arel_table[:created_at].gt(1.hour.ago))}


end
