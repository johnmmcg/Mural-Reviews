class Api::V1::MuralsController < ApiController
  def index
    murals= Mural.all
    render json: murals
  end

  def show
    mural = Mural.find(params[:id])
    user = mural.user
    data = {
      mural: mural,
      user: user
    }
    render json: data
  end
end
