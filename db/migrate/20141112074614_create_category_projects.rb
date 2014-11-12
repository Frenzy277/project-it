class CreateCategoryProjects < ActiveRecord::Migration
  def change
    create_table :category_projects do |t|
      t.integer :category_id, :project_id
      t.timestamps
    end
    add_index :category_projects, :category_id
    add_index :category_projects, :project_id
  end
end
