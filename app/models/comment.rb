class Comment < ApplicationRecord
  validates :opinion, length: {maximum: 140 }

  has_one :movie
end
