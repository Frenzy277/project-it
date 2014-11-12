class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id, :likeable_id
      t.string :likeable_type
      t.boolean :like
      t.datetime :created_at
    end
    add_index :likes, :user_id
    add_index :likes, [:likeable_id, :likeable_type]
  end
end
