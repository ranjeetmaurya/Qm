class AddGooglePlusSkypeNamePhoneNumber < ActiveRecord::Migration
  def change
    add_column :users, :google_plus_profile_url, :string
    add_column :users, :skype, :string
    add_column :users, :phone, :integer
    add_column :users, :linked_in_image_url, :string
    add_column :users, :linked_public_profile, :string    
  end
end
