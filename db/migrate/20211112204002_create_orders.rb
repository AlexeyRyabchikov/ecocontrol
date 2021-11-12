class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.date :date
      t.text :comment
      t.string :state

      t.timestamps
    end
  end
end
