module V1
  module Devices
    class DeviceSequencesController < ApplicationController
      before_action :authenticate!
      before_action :set_device_sequence, only: %i[update]

      def create
        @device_sequence = @current_device.device_sequences.create(device_sequence_params)
        if @device_sequence.valid?
          @device_sequence.save
          render :show, status: :created
        else
          render json: { errors: @device_sequence.errors.full_messages }, status: :bad_request
        end
      end

      def update
        if @device_sequence.update(device_sequence_params)
          render :show, status: :ok
        else
          render json: { errors: @device_sequence.errors.messages }, status: :bad_request
        end
      end

      private

      def device_sequence_params
        params.require(:device_sequence).permit(:name)
      end

      def set_device_sequence
        @device_sequence = @current_device.device_sequences.find(params[:id])
      end
    end
  end
end
