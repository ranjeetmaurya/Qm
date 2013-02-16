class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
    	t.string :title
    	t.integer :user_id
      t.timestamps
    end
  end
end
