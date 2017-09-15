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
        id: review.id,
        body: review.review,
        rating: review.rating,
        user: User.find(review.user_id),
        votes: review.votes
      }
    end
    data = {
      mural: mural,
      user: user,
      reviews: reviews,
      current_user: current_user
    }
    render json: data
  end

  def destroy
    mural = Mural.find(params[:id])
    mural.delete

    user = mural.user
    reviews = mural.reviews.map do |review|
      {
        id: review.id,
        body: review.review,
        rating: review.rating,
        user: User.find(review.user_id),
        votes: review.votes
      }
    end

    data = {
      mural: mural,
      user: user,
      reviews: reviews,
      current_user: current_user
    }

    render json: data


  end
end
