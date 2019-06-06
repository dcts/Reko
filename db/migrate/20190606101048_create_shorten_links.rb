class CreateShortenLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :shorten_links do |t|
      t.string :link

      t.timestamps
    end
  end
end
