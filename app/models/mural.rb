class Mural < ApplicationRecord
  has_many :reviews
  belongs_to :user

  validates_presence_of :name, :location, :description, :rating

  validates :mural_upload, presence: true, unless: ->{photo_url.present?}
  validates :photo_url, presence: true, unless: ->{mural_upload.present?}

  def self.search(query)
    where("name like ?", "%#{query}%")
  end

  mount_uploader :mural_upload, MuralPhotoUploader

end
