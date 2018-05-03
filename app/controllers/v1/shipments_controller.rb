class V1::ShipmentsController < ApplicationController
  def index
    status_param = params.require(:status).downcase
    customer_param = params.require(:customer)
    @shipments = Shipment.get_shipments({
      customer: customer_param,
      status: status_param
    })
    # Shipment.joins(:order)
    #   .where(orders: { customer_id: customer_param })
    #   .where("status = ?", )

    render json: @shipments
  end

  def show
    render json: Shipment.find(params[:id])
  end
end
