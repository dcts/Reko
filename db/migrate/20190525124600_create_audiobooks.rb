class CreateAudiobooks < ActiveRecord::Migration[5.2]
  def change
    create_table :audiobooks do |t|
      t.string :title

      t.timestamps
    end
  end
end
