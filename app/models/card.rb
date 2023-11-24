class Card < ApplicationRecord
  has_one_attached :image
  has_one_attached :background_image
end
