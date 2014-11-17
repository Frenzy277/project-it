class UpdateJobColumns < ActiveRecord::Migration
  def change
    remove_column :jobs, :status
    
  end
end
