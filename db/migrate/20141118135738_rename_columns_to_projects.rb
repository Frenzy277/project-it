class RenameColumnsToProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :project_name, :title
    rename_column :projects, :project_description, :description
    rename_column :jobs, :job_name, :name
  end
end
