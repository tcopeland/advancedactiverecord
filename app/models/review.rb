class Review < ApplicationRecord

  belongs_to :book
  belongs_to :reviewer
  
  scope :featured, -> { where(featured: true) }
  
  validates :featured, uniqueness: {scope: :book_id, message: "review already exists for this book"}, if: Proc.new {|r| r.featured? }

  include AASM

  aasm do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: [:draft], to: :published
    end
  end

end
