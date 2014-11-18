class ChangeJobIdToProjectIdInComments < ActiveRecord::Migration
  def change
    remove_index :comments, :job_id
    rename_column :comments, :job_id, :project_id
    add_index :comments, :project_id
  end
end
