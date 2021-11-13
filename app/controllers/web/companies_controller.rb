class Web::CompaniesController < Web::ApplicationController
  def index
    @companies = Company.all.sort_by do |company|
      case
      when !company.nvos_checked && company.okveds.first.dangerous && company.clame_counter > 0
        0
      when !company.nvos_checked && (company.okveds.first.dangerous || company.clame_counter > 0)
        1
      else
        2
      end
    end
    render :index
  end
end
