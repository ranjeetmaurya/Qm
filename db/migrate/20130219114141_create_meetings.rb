class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :meeting_details
      t.datetime :meeting_time
      t.timestamps
    end
  end
end
