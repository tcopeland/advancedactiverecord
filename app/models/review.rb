class Review < ApplicationRecord

  belongs_to :book
  belongs_to :reviewer
  
  include AASM
  
  aasm do
    state :draft, initial: true
    state :published
    
    event :publish do
      transitions from: [:draft], to: :published
    end
  end
  
end