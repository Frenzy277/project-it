class AddStatusToJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :week
    add_column :jobs, :status, :string, default: "in progress"
  end
end
