class Review < ApplicationRecord

  module Spamify
    def spamify!
      not_spam.map(&:spamify!)
    end
  end

  module Publish
    def publish_all!
      where(aasm_state: "draft").map(&:publish!)
    end
  end

  def self.most_recent_featured
    featured.last
  end

  validates :featured, uniqueness: {scope: :book, message: "review already exists for this book"}, if: Proc.new {|r| r.featured? }

  belongs_to :book
  belongs_to :reviewer

  scope :featured, -> { where(featured: true) }
  scope :not_spam, -> { where.not(aasm_state: 'spam')}
  scope :mrf_scope, -> { featured.limit(1) }
  scope :in_past_week, -> { where(arel_table[:created_at].gt(1.week.ago)) }

  include AASM

  aasm do
    state :draft, initial: true
    state :published
    state :spam

    event :publish do
      transitions from: [:draft], to: :published
    end

    event :spamify do
      transitions from: [:draft, :published], to: :spam
    end
  end

end
