class Comment < ApplicationRecord
  validates :opinion, length: {maximum: 140 }

  belongs_to :movie
  belongs_to :user

  scope :watched, -> { where(watched: [true]) }
end
