require 'pry'

class Api::V1::VotesController < ApiController
  skip_before_action :verify_authenticity_token

  def create
    binding.pry
  end
end
