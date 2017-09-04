class Rating < ApplicationRecord

  belongs_to :book

  default_scope -> { where(approved: true) }

end
