module V1
  class DevicesController < ApplicationController
    before_action :authenticate!
    before_action :set_organization, only: %i[index]
    before_action :set_device, only: %i[update]

    def create
      @device = @current_user.organization.devices.new(device_params)
      if @device.valid?
        @device.save
        render :show, status: :created
      else
        render json: { errors: @device.errors.full_messages }, status: :bad_request
      end
    end

    def update
      if @device.update(device_params)
        render :show, status: :ok
      else
        render json: { errors: @device.errors.messages }, status: :bad_request
      end
    end

    def index
      @devices = @organization.devices
    end

    private

    def set_organization
      @organization = Organization.preload(devices: [:token, :device_groups]).find(@current_user.organization_id)
    rescue StandardError => e
      head :unauthorized
    end

    def set_device
      @device = @current_user.organization.devices.find(params[:id])
    rescue StandardError => e
      head :unauthorized
    end

    def device_params
      params.require(:device).permit(:name, :status)
    end
  end
end
