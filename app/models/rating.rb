class Rating < ApplicationRecord

  belongs_to :book

  default_scope -> { where(approved: true) }
  
  scope :not_approved, -> { rewhere(approved: false) }

end
