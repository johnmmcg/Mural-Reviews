class Mural < ApplicationRecord
  has_many :reviews
  belongs_to :user

  validates_presence_of :name, :location, :description, :rating

  validate :mural_upload_xor_photo_url


  def self.search(query)
    where("name like ?", "%#{query}%")
  end

  mount_uploader :mural_upload, MuralPhotoUploader

  private
  def mural_upload_xor_photo_url
    unless mural_upload.blank? ^ photo_url.blank?
      errors.add(:base, "Please specify a photo url or upload a mural picture, but not both.")
    end
  end

end
