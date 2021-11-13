class Web::CompaniesController < Web::ApplicationController
  def index
    @companies = Company.all
    render :index
  end
end
