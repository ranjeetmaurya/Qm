class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
    	t.string :title
    	t.integer :user_id
      t.timestamps
    end
  end
end
