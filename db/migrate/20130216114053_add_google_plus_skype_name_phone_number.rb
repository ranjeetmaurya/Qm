class AddGooglePlusSkypeNamePhoneNumber < ActiveRecord::Migration
  def change
    add_column :users, :google_plus, :string
    add_column :users, :skype, :string
    add_column :users, :phone, :integer
  end
end
