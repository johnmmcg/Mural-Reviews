class Mural < ApplicationRecord
  has_many :reviews
  belongs_to :user
  
  validates_presence_of :name, :location, :photo_url, :description, :rating
end
