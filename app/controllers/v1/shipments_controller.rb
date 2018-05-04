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

  def summary
    total = Shipment.all.count
    late = Shipment.all.late.count
    very_late = Shipment.all.very_late.count

    render json: { on_time: total - late, late: late - very_late, very_late: very_late }
  end
end
