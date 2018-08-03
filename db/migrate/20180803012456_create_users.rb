class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :dni
      t.string :password
      t.integer :role
      t.string :photo_url
      t.integer :company_id
      t.timestamps
    end
  end
end
