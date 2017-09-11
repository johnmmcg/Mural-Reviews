class Api::V1::MuralsController < ApiController
  def index
    murals= Mural.all
    render json: murals
  end

  def show
    mural = Mural.find(params[:id])
    user = mural.user
    reviews = mural.reviews.map do |review|
      {
        body: review.review,
        rating: review.rating,
        user: User.find(review.user_id)
      }
    end

    data = {
      mural: mural,
      user: user,
      reviews: reviews
    }
    render json: data
  end
end
