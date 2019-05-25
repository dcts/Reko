class CreateRekos < ActiveRecord::Migration[5.2]
  def change
    create_table :rekos do |t|
      t.references :list, foreign_key: true
      t.references :content, polymorphic: true, index: true

      t.string :creator_name

      t.timestamps
    end
  end
end
