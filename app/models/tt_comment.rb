class TtComment < ApplicationRecord
  def parent
    CommentLink.where()
  end
end
