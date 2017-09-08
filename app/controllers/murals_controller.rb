class MuralsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def new
    @mural = Mural.new
  end

  def create
    @mural = Mural.new(mural_params)
    @mural.user = current_user
    if @mural.save
      flash[:notice] = 'Mural added successfully'
      redirect_to mural_path(@mural)
    else
      flash[:notice] = @mural.errors.full_messages.join(', ')
      render :new
    end
  end

  def index
    @murals = Mural.all
  end

  def show
    @mural = Mural.find(params[:id])
    @reviews = @mural.reviews
    ratingTotal = @mural.rating
    @reviews.each do |review|
      ratingTotal += review.rating
    end
    @averageRating = ratingTotal/(@reviews.length + 1)
  end

  private

  def mural_params
    params.require(:mural).permit(:name, :location, :description, :rating, :photo_url)
  end
end
