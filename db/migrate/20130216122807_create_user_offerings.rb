class CreateUserOfferings < ActiveRecord::Migration
  def change
    create_table :user_offerings do |t|
    	t.integer :user_id
    	t.integer :offering_id
      t.timestamps
    end
  end
end
