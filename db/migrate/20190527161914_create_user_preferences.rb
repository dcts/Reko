class CreateUserPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :user_preferences do |t|
      t.references :user
      t.references :preference

      t.timestamps
    end
  end
end
