class RentingsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @user = current_user
    @movie = Movie.find(params[:movie_id])
    @renting = Renting.new(movie: @movie, user: @user, status: true)
    p @renting.save!
    redirect_to movie_path(@movie)
  end
end
