class AddDefaultToProjectStatus < ActiveRecord::Migration
  def change
    change_column :projects, :status, :string, default: "in-progress"
  end
end
