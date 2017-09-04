class Book < ApplicationRecord
  has_and_belongs_to_many :authors

  has_many :reviews do
    def featured
      where(featured: true).first
    end
  end
  has_many :ratings
  has_one :featured_review, -> { featured }, class_name: 'Review'
end
