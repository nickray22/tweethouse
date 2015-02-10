class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
    	t.string :body
    	t.integer :user_id
    	t.timestamps :created_at, null: false
    	t.timestamps :updated_at, null: false
    end
  end
end
