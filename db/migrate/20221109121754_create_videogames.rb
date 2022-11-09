class CreateVideogames < ActiveRecord::Migration[7.0]
  def change
    create_table :videogames do |t|
      t.string :title
      t.string :developer
      t.string :publisher
      t.date :release_date
      t.string :genre

      t.timestamps
    end
  end
end
