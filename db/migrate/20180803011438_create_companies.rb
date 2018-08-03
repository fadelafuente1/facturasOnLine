class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :cif
      t.string :email
      t.string :logo_url
      t.string :account
      t.string :contact_email
      t.string :contact_name
      t.timestamps
    end
  end
end
