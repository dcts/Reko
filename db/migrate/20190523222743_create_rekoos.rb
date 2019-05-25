class CreateRekoos < ActiveRecord::Migration[5.2]
  def change
    create_table :rekoos do |t|
      t.references :list, foreign_key: true
      t.references :recommendable, polymorphic: true, index: true

      t.string :creator_name

      t.timestamps
    end
  end
end
