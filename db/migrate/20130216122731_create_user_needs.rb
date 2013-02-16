class CreateUserNeeds < ActiveRecord::Migration
  def change
    create_table :user_needs do |t|
    	t.integer :user_id
    	t.integer :need_id
      t.timestamps
    end
  end
end
