class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :status, defailt: 0
      t.string :name
      t.string :phone
      t.string :email
      t.string :post_code
      t.string :address

      t.timestamps
    end
  end
end
