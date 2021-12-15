module V1
  module Devices
    class DevicePortsController < ApplicationController
      before_action :authenticate!
      before_action :set_device_port, only: %i[update]

      def index
        @device_ports = @current_device.device_ports.where(device_id: @current_device.id)
      end

      def create
        if device_ports_params
          create_device_ports
        else
          @device_port = @current_device.device_ports.create(device_port_params)
          if @device_port.valid?
            @device_port.save
            render :show, status: :created
          else
            render json: { errors: @device_port.errors.full_messages }, status: :bad_request
          end
        end
      end

      def update
        if @device_port.update(device_port_params)
          render :show, status: :ok
        else
          render json: { errors: @device_port.errors.messages }, status: :bad_request
        end
      end

      def display_messages_errors
        @result_device_ports.reject(&:valid?)
                            .map do |device_port|
          {
            port: device_port.port,
            status: device_port.status,
            messages: device_port.errors.messages
          }
        end
      end

      private

      def create_device_ports
        @result_device_ports = @current_device.device_ports.create(device_ports_params)
        @device_ports = @result_device_ports.select(&:id)
        @device_ports_errors = display_messages_errors
        render :index, status: @device_ports.size.positive? ? :created : :bad_request
      end

      def set_device_port
        @device_port = @current_device.device_ports.find(params[:id])
      end

      def device_ports_params
        device_port_collection_params[:device_ports]
      end

      def device_port_collection_params
        params.permit(device_ports: %i[status port])
      end

      def device_port_params
        params.require(:device_port).permit(:status, :port)
      end
    end
  end
end
