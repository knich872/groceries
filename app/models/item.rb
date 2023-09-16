class Item < ApplicationRecord
  CATEGORIES = ["meats", "produce", "seafood", "drinks", "dairy", "grains", "canned", "frozen", "baking", "sauces", "cleaning", "hygiene", "other"]
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items
  validates :name, presence: true, uniqueness: true
  # validates :category, inclusion: { in: CATEGORIES }
  enum category: [:meats, :produce, :seafood, :drinks, :dairy, :grains, :canned, :frozen, :baking, :sauces, :cleaning, :hygiene, :other]
  has_many_attached :photos

  include PgSearch::Model

  pg_search_scope :search_by_keywords,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
end
