class ShoppingCart < ApplicationRecord
  has_many :cart_members
  has_many :users, through: :cart_members
  validates :name, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_keywords,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
end
