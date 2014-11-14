class RenameColumns < ActiveRecord::Migration
  def change
    rename_column :projects, :name, :project_name
    rename_column :jobs, :name, :job_name
  end
end
