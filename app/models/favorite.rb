# Since the Favorites table is the only one in our database (with two columns for movie_id and title), this
# is the only piece of our app that requires a model-- remember, model's speak to our database for us, whereas
# the controllers handle the logic in HOW the communication is set.

class Favorite < ActiveRecord::Base
end