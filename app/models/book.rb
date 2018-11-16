class Book < ApplicationRecord

  class ASIN < ActiveRecord::Type::String
    def serialize(value)
      super.upcase if value.present?
    end
  end

  attribute :uuid, :string , default: -> { SecureRandom.uuid }
  attribute :asin, :my_asin

  validates :uuid, presence: {strict: true}

  has_and_belongs_to_many :authors

  # has_many :reviews do
  #   def featured
  #     where(featured: true).first
  #   end
  # end
  has_many :reviews, -> { extending Review::Spamify } do
    def featured
      where(featured: true).first
    end
  end
  has_many :ratings
  has_many :reviewers, through: :reviews
  has_many :all_ratings, -> { unscope(where: :approved) }, class_name: 'Rating'
  has_one :featured_review, -> { featured }, class_name: 'Review', inverse_of: :book

  scope :reviewed_in_last_week, -> { joins(:reviews).merge(Review.in_past_week) }

end
