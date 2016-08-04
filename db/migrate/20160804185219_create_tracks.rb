class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :album_id
      t.string :track_type
      t.text :lyrics

      t.timestamps null: false
    end
  end
end
