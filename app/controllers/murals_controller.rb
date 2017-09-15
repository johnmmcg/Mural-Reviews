class MuralsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def new
    @mural = Mural.new
    @rating_collection = [
      [1, "1"],
      [2, "2"],
      [3, "3"],
      [4, "4"],
      [5, "5"]
     ]
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

    if params[:search]
      @murals = Mural.search(params[:search]).order("created_at DESC")
    else
      @users = Mural.all.order('created_at DESC')
    end
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

  def destroy
    @mural = Mural.find(params[:id])
    @mural.delete
    flash[:notice] = 'Mural successfully deleted.'
    redirect_to root_path
  end

  private

  def mural_params
    params.require(:mural).permit(:name, :location, :description, :rating, :photo_url, :mural_upload)
  end
end
