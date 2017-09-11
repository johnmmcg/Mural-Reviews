class UploadMuralPhotoToMurals < ActiveRecord::Migration[5.0]
  def change
    add_column :murals, :mural_upload, :string
  end
end
