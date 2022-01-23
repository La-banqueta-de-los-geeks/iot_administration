module V1
  module Devices
    class DeviceGroupsController < ApplicationController
      before_action :authenticate!
      before_action :set_device_group, only: %i[update]

      def index
        @device_groups = @current_device.device_groups
        render :index, status: :ok
      end

      def create
        @device_group = @current_device.device_groups.new(device_group_params)

        if @device_group.valid?
          @device_group.save
          render :show, status: :created
        else
          render json: @device_group.errors, status: :unprocessable_entity
        end
      end

      def update
        if @device_group.update(device_group_params)
          render :show, status: :ok
        else
          render json: @device_group.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_device_group
        @device_group = @current_device.device_groups.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def device_group_params
        params.require(:device_group).permit(:name)
      end
    end
  end
end
