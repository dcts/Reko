class CreateBetaApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :beta_applicants do |t|
      t.string :email

      t.timestamps
    end
  end
end
