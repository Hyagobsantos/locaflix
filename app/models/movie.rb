class Movie < ApplicationRecord
  has_one :comment
  belongs_to :user

end
