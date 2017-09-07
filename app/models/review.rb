class Review < ApplicationRecord
  belongs_to :user
  belongs_to :mural
  validates_presence_of :user_id, :mural_id, :rating, :review
end
