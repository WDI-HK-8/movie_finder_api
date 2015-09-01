class MoviesController < ApplicationController
  def index
    require 'open-uri'

    url = "http://www.omdbapi.com?s=" + params[:query]
    url_data = open(url).read

    render json: url_data
  end

  def show
    require 'open-uri'

    url = "http://www.omdbapi.com?i=" + params[:omdb_id]
    url_data = open(url).read

    render json: url_data
  end
end
