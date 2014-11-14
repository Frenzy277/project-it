class AddTeamToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :team, :boolean, default: false
  end
end
