class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 7, message: "must be at least 7 characters long" }
  validates_uniqueness_of :list_id, scope: :movie_id

end
