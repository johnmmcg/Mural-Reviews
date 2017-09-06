class MuralsController < ApplicationController

  def new
    @mural = Mural.new
  end

  def create
    @mural = Mural.new(mural_params)

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

  end

  private

  def mural_params
    params.require(:mural).permit(:name, :location, :average_rating, :photo_url)
  end
end
