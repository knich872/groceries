class Item < ApplicationRecord
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items
  validates :name, presence: true, uniqueness: true
  has_many_attached :photos

  include PgSearch::Model

  pg_search_scope :search_by_keywords,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
end
