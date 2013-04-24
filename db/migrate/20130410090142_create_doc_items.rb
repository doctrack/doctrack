class CreateDocItems < ActiveRecord::Migration
  def change
    create_table :doc_items do |t|
      t.integer :doc_id
      t.string :chapter_name
      t.text :content

      t.timestamps
    end
  end
end
