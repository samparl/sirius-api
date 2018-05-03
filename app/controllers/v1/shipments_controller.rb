class V1::ShipmentsController < ApplicationController
  def index
    status = params[:status]
    customer = params[:customer]
    vendor = params[:vendor]
    late = params[:late]

    @shipments = Shipment.where(nil)
    @shipments = @shipments.vendor(vendor) if vendor.present?
    @shipments = @shipments.customer(customer) if customer.present?
    @shipments = @shipments.status(status.downcase) if status.present?
    # puts [:original_delivery, :estimated_delivery]
    # @shipments = @shipments.late if late.present?

    render json: @shipments
  end

  def show
    render json: Shipment.find(params[:id])
  end
end
