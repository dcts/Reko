class CreatePodcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :podcasts do |t|
      t.integer :itunes_id
      t.string :image_url
      t.string :title
      t.string :episode

      t.timestamps
    end
  end
end
