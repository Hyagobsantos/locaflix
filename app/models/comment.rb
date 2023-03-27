class Comment < ApplicationRecord
  validates :opinion, length: {maximum: 140 }

  belongs_to :movie
end
