class RenameTypeToDocTypeInDocs < ActiveRecord::Migration
  def up
    rename_column :docs, :type, :doc_type
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
