class AddFirstNameCompanyNameLastNameZipCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company_name, :string
    add_column :users, :zip_code, :string
    add_column :users, :company_url, :string
  end
end
