class InitialSchema < ActiveRecord::Migration

  def up
    create_table :users do |t|
      t.string :email, null: false
      t.string :username , null: false
      t.timestamps
    end

    create_table :movies do |t|
      t.string :title, null: false
      t.string :director, null: false
      t.integer :rating
      t.date :release_date
      t.timestamps
    end

    create_table :favorites do |t|
      t.references :user, null: false
      t.references :movie, null: false
      t.timestamps
    end
  end

  def down
    drop_table :users
    drop_table :movies
    drop_table :favorites
  end

end
