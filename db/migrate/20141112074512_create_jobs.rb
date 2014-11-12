class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :project_id, :user_id
      t.string :name, :status, :week
      t.text :description
      t.timestamps
    end
    add_index :jobs, :project_id
    add_index :jobs, :user_id
  end
end
