require 'date'

class ReviewsController < ApplicationController
  def new
    @user = current_user
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.movie = Movie.find(params[:movie_id])
    @review.date_comment = Date.today
    @review.save!
    redirect_to movie_path(@review.movie)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
