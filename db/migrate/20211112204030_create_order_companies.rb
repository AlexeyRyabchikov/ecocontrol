class CreateOrderCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :order_companies do |t|
      t.references :order, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
