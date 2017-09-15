class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def new
    @mural = Mural.find(params[:mural_id])
    @review = Review.new
    @rating_collection = [
      [1, "1"],
      [2, "2"],
      [3, "3"],
      [4, "4"],
      [5, "5"]
     ]
  end

  def create
    @mural = Mural.find(params[:mural_id])
    @review = Review.create(review_params)
    @review.mural = @mural
    @review.user = current_user
    if @review.save
      ReviewMailer.new_review(@review).deliver_now
      flash[:notice] = 'Review added successfully'
      redirect_to mural_path(@mural)
    else
      flash[:notice] = @review.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @mural = @review.mural
    @review.delete
    flash[:notice] = 'Review successfully deleted.'
    redirect_to mural_path(@mural)
  end

  private
  def review_params
    params.require(:review).permit(:rating, :review)
  end
end
