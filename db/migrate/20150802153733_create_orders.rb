class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.text :adres
      t.string :pay_type
      t.string :email

      t.timestamps
    end
  end
end
