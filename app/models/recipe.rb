class Recipe < ApplicationRecord
  before_save :remove_blank_ingredients
  belongs_to :user
  has_many :bookmarks
  has_many :reviews, dependent: :destroy

  validates :name, :ingredients, :prep_time, :instructions, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  def remove_blank_ingredients
    ingredients.reject!(&:blank?)
  end
end
