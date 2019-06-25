class AddOwnersTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :owner_token, :string
  end
end
