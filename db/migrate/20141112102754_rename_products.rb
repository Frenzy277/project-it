class RenameProducts < ActiveRecord::Migration
  def change
    rename_table :products, :projects
  end
end
