class V1::ShipmentsController < ApplicationController
  def index
    status = params[:status]
    customer = params[:customer]
    vendor = params[:vendor]
    late = params[:late]
    page = params[:page] || 0

    @shipments = Shipment.where(nil)
    @shipments = @shipments.vendor(vendor) if vendor.present?
    @shipments = @shipments.customer(customer) if customer.present?
    @shipments = @shipments.status(status.downcase) if status.present?
    @shipments = @shipments.late if late.present? && late.to_s == 'true'
    @shipments = @shipments.page(page)

    render json: {
      page_count: @shipments.total_pages,
      shipments: @shipments.order(created_at: :desc).to_json(include: { vendor: { only: [:name, :email] }})
      }
  end

  def show
    render json: Shipment.find(params[:id])
  end

  def summary
    render json: Shipment.summary
  end
end
