class MoviesController < ApplicationController
  # before_action :find, only: [:show]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id].to_i)
  end

end
