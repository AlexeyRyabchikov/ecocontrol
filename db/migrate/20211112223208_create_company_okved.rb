class CreateCompanyOkved < ActiveRecord::Migration[6.1]
  def change
    create_table :company_okveds do |t|
      t.belongs_to :company
      t.belongs_to :okved

      t.timestamps
    end

    Company.where.not(okved_id: nil).each do |company|
      CompanyOkved.create(company: company, okved_id: company.okved_id)
    end

    remove_column :companies, :okved_id
  end
end
