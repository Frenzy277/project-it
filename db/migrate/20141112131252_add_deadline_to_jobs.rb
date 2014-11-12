class AddDeadlineToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :deadline, :date
  end
end
