class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :password_digest, :time_zone, :slug

      t.timestamps
    end
  end
end
