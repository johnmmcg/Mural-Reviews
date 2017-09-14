class Review < ApplicationRecord
  belongs_to :user
  belongs_to :mural
  has_many :votes
  
  validates_presence_of :user_id, :mural_id, :rating, :review
end
