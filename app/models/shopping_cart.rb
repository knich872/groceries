class ShoppingCart < ApplicationRecord
  has_many :cart_members
  has_many :users, through: :cart_members
  has_many :cart_items
  has_many :items, through: :cart_items
  validates :name, presence: true, uniqueness: true

  include PgSearch::Model

  pg_search_scope :search_by_keywords,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
end
