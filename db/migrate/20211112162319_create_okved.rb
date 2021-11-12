class CreateOkved < ActiveRecord::Migration[6.1]
  def change
    create_table :okveds do |t|
      t.string :section, null: false
      t.string :code
      t.string :name, null: false

      t.timestamps
    end

    add_index(:okveds, :code, unique: true, name: 'okved_code')
  end
end
