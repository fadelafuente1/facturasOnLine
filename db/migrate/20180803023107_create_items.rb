class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :description
      t.integer :type
      t.float :amount
      t.integer :bill_id
      t.timestamps
    end
  end
end
