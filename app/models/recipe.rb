class Recipe < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :reviews
end
