class CreateAudiobooks < ActiveRecord::Migration[5.2]
  def change
    create_table :audiobooks do |t|
      t.integer :itunes_id
      t.string :image_url
      t.string :title
      t.string :author

      t.timestamps
    end
  end
end
