class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @user = current_user
  end

  def show
    @movie = Movie.find(params[:id])
    @user = current_user
  end

  def profile
    @user = current_user
    @movies = @user.movies
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to profile_movies_path
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.delete
    redirect_to profile_movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_date, :duration, :description, :category, :director, :cover, :price)
  end
end
