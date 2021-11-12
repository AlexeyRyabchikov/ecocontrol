class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :email
      t.string :phone
      t.string :inn
      t.string :ogrn
      t.string :address
      t.string :state

      t.timestamps
    end
  end
end
