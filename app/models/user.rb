class User < ActiveRecord::Base
  
  has_many :favorites
  has_many :movies, through: :favorites


  def self.titanic_lovers
    titanic_lovers = []
    User.all.each do |user|
      user.movies.each do |movie|
        titanic_lovers << user if movie.title == "Titanic"
      end
    end
    titanic_lovers
  end

  def fancy_json
    { name: "#{self.username} is fancy" }
  end

end