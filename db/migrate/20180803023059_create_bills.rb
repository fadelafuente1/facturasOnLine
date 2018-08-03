class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.string :name
      t.integer :billing_id
      t.float :total
      t.date :date
      t.string :billing_address
      t.string :billing_name
      t.string :billing_city
      t.string :billing_postal_code
      t.string :billing_cif
      t.integer :company_id
      t.timestamps
    end
  end
end
