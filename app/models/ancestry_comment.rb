class AncestryComment < ApplicationRecord
  has_ancestry
  belongs_to :parent, class_name: 'AncestryComment', optional: true
  has_many :children, class_name: 'AncestryComment', foreign_key: 'parent_id'
end
