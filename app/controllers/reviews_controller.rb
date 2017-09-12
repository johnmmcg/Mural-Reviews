class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def new
    @mural = Mural.find(params[:mural_id])
    @review = Review.new
  end

  def create
    @mural = Mural.find(params[:mural_id])
    @review = Review.create(review_params)
    @review.mural = @mural
    @review.user = current_user
    if @review.save
      ReviewMailer.new_review(@review).deliver_later
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
    redirect_to mural_path(@mural)
  end

  private
  def review_params
    params.require(:review).permit(:rating, :review)
  end
end
