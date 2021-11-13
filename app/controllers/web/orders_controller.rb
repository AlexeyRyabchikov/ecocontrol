class Web::OrdersController < Web::ApplicationController
  def search_companies; end

  def new
    @order = Order.new
    @companies = Company.limit(10).select(:id, "concat_ws(';', name, activity_type, address) as desc")
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