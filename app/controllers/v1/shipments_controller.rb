class V1::ShipmentsController < ApplicationController
  def index
    status = params[:status]
    customer = params[:customer]
    vendor = params[:vendor]
    late = params[:late]

    @shipments = Shipment.includes(:vendor)
    # @shipments = Shipment.find :all, include: :vendor
    @shipments = @shipments.vendor(vendor) if vendor.present?
    @shipments = @shipments.customer(customer) if customer.present?
    @shipments = @shipments.status(status.downcase) if status.present?
    @shipments = @shipments.late if late.present? && late.to_s == 'true'

    render json: @shipments.order(created_at: :desc).limit(10).to_json(include: :vendor)
  end

  def show
    render json: Shipment.find(params[:id])
  end
end
