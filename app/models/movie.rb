class Movie < ApplicationRecord
  has_many :bookmarks #, dependent: :destroy
  validates :title, :overview, presence: true # :poster_url, :rating
  # validates :rating, numericality: true
  validates :title, uniqueness: true
end
