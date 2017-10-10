class Book < ApplicationRecord
  
  attribute :uuid, :string , default: -> { SecureRandom.uuid }
  
  validates :uuid, presence: true, strict: true

  has_and_belongs_to_many :authors

  has_many :reviews do
    def featured
      where(featured: true).first
    end
  end
  has_many :ratings
  has_many :reviewers, through: :reviews
  has_many :all_ratings, -> { unscope(where: :approved) }, class_name: 'Rating'
  has_one :featured_review, -> { featured }, class_name: 'Review'
  
  scope :reviewed_in_last_week, -> { joins(:reviews).merge(Review.in_past_week) }

end
