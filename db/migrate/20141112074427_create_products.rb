class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :status, :slug, :github_url, :heroku_url
      t.integer :manager_id
      t.date :end_date
      t.timestamps
    end
    add_index :products, :manager_id
  end
end
