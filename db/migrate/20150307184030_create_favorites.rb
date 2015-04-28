class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :movie_id
      t.string :title
    end
  end
end
