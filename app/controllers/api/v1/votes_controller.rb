class Api::V1::VotesController < ApiController
  skip_before_action :verify_authenticity_token

  def create

    data= JSON.parse(request.body.read)

    new_vote = Vote.create(user_id: current_user.id, review_id: data["review_id"], direction: data["direction"])



    mural = Mural.find(params[:mural_id])
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
    vote = Vote.find(params[:id])
    vote.delete

    mural = Mural.find(params[:mural_id])
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
