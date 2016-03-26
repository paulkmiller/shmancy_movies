# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Movie.delete_all
User.delete_all
Favorite.delete_all

# date = fuckin stringified year/10/23
movies = Movie.create([
  { title: "Titanic", director: "James Camry", rating: 7, release_date: "1998-10-23" },
  { title: "True Lies", director: "Jason Stathom", rating: 5, release_date: "1998-04-20" },
  { title: "The Mask", director: "God", rating: 10, release_date: "2000-03-19" }
])

users = User.create([
  { email: "paul@example.com", username: "pmiller" },
  { email: "sam@example.com", username: "samwise" }
])

Favorite.create([
  { user_id: users.first.id, movie_id: movies.first.id },
  { user_id: users.last.id, movie_id: movies[1].id },
  { user_id: users.last.id, movie_id: movies[2].id}
])
