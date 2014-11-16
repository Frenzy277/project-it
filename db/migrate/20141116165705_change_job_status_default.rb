class ChangeJobStatusDefault < ActiveRecord::Migration
  def change
    remove_column :jobs, :status, :string
    add_column :jobs, :status, :string, default: "in progress"
  end
end
