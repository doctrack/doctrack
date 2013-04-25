class RenameNameToUsernameInUsers < ActiveRecord::Migration
  def up
    rename_column :users, :username, :name
  end
  
  def down
    rename_column :users, :username, :name
  end
end
