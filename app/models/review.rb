class Review < ApplicationRecord
  belongs_to :restaurant
  # if i have a review, then i can do review.restaurant
end
