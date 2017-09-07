class AddReviewRatingToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :review, :text, null: false
    add_column :reviews, :rating, :integer, null: false
  end
end
