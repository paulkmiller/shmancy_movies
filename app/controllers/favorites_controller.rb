# In this Controller, we define the logic behind "@favorites", giving it specific instructions depending on
# how we decide to use it. Simply calling on "@favorites", like we do in our index.html.erb file (located 
# in our views/favorites folder), it'll call all favorited items pushed into our database and run whatever
# additional methods you declare in the views. Equally, we're allowing "@favorite" to create new "favorites"
# using the favorite_params we're passing from ln 14, requires the movie_id and title for our database.


class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
  end

  def create
    favorite_params = params.require(:favorite).permit(:movie_id, :title)
    @favorite = Favorite.create(favorite_params)
    redirect_to favorites_path
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to favorites_path
  end

end