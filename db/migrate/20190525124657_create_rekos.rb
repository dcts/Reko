class CreateRekos < ActiveRecord::Migration[5.2]
  def change
    create_table :rekos do |t|
      t.references :user, foreign_key: true
      t.references :content, polymorphic: true, index: true

      t.string :teller_name

      t.timestamps
    end
  end
end
