class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :name
      t.integer :user_id
      t.string :type, :default => "single"
      t.string :group_id
      t.boolean :status, :default => true
      t.timestamps
    end
    add_index :docs, :name
  end
end
