class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :band_id
      t.string :recording_type

      t.timestamps null: false
    end
  end
end
