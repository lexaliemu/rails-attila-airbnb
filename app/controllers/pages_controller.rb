class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @movies = Movie.all.sort.first(6)
  end


end
