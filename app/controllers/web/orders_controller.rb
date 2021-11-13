class Web::OrdersController < Web::ApplicationController
  def search_companies; end

  def index
    @orders = Order.joins(:companies).all.order('date desc').group('orders.id').select('orders.*', 'COUNT(companies.id) as companies_count')
  end

  def new
    @order = Order.new
    @companies = Company.where(nvos_checked: false)
                        .sample(10)
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
end
