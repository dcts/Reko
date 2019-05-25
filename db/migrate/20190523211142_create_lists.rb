class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :owner_token
      t.string :visitor_token
      t.string :token
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
