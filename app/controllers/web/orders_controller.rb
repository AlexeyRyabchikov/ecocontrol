class Web::OrdersController < Web::ApplicationController
  def search_companies
    @companies = Company.all
  end

  def index
    @orders = Order.joins(:companies).all.order('date desc').group('orders.id').select('orders.*', 'COUNT(companies.id) as companies_count')
  end

  def new
    @order = Order.new
    @companies = find_companies
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:date, :comment, company_ids: [])
  end

  def find_companies
    dangerous_companies = Company.joins(:okveds)
                                 .where("okveds.dangerous = 't' AND clame_counter > 0")
                                 .distinct('id')
                                 .limit(2)
    other_companies = Company.where(nvos_checked: false)
                             .where.not(id: dangerous_companies.select(:id))
                             .sample(8)

    [*dangerous_companies, *other_companies].shuffle
  end
end
