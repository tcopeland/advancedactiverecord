class CommentLink < ApplicationRecord
  belongs_to :parent, class_name: 'TtComment'
  belongs_to :child, class_name: 'TtComment'
end
