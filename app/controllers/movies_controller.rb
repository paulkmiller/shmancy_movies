# Using HTTParty, we're calling the OMDBapi and gsubing the extranneous string information we'll need to
# build a URL compatible with their API. Notice how gsub is only being used in the Index method and not
# the show method-- one requires a specifically tailored link that'll pull information from our API, whereas
# the show method takes information from our database and converts it into data our API will understand, 
# populating our list of favorite movies! This ruby interface, which is already caked in how we use ActiveRecord,
# makes HTTParty the best party! Now all we have to do is make / look at the corresponding views to these
# controllers and start using our logic on the client-side! 

# This can be equally achieved using Javascript or jQuery vs Rails conventions-- it's entirely up to you. 
# There's no greather flavor than the other, so long as you understand what you're accomplishing.


class MoviesController < ApplicationController

  def index
    if params[:search]
      search = params[:search].gsub(' ', '+')
      response = HTTParty.get("http://www.omdbapi.com/?s=#{search}")
      results = JSON.parse(response.body)
      @results = results['Search']
    else
      @results = []
    end
  end

  def show
    response = HTTParty.get("http://www.omdbapi.com/?i=#{params[:id]}")
    @result = JSON.parse(response.body)
    @favorite = Favorite.find_by(movie_id: params[:id])
    
    if !@favorite 
      @favorite = Favorite.new(movie_id: @result['imdbID'], title: @result['Title'])
    end
  end

end