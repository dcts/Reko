class CreateSeries < ActiveRecord::Migration[5.2]
  def change
    create_table :series do |t|
      t.integer :itunes_id
      t.string :image_url
      t.string :title
      t.integer :season

      t.timestamps
    end
  end
end
