class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile
      t.string :public_email

      t.timestamps
    end
  end
end
