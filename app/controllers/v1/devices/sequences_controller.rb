module V1
  module Devices
    class SequencesController < ApplicationController
      before_action :authenticate!
      before_action :set_device_group
      before_action :set_device_sequence
      before_action :set_sequence, only: %i[update]

      def create
        @sequence = @device_sequence.sequences.new(sequence_params)
        if @sequence.valid?
          @sequence.save
          render :show, status: :created
        else
          render json: { errors: @sequence.errors.full_messages }, status: :bad_request
        end
      end

      def index
        @sequences = @device_sequence.sequences
        render :index, status: :ok
      end

      private

      def set_device_group
        @device_group = @current_device.device_groups.find(params[:device_group_id])
      end


      def set_device_sequence
        @device_sequence = @device_group.device_sequences.find(params[:device_sequence_id])
      end

      def sequence_params
        params.require(:sequence).permit(:port_value_id,:device_port_id)
      end

      def set_sequence
        @sequence = @device_group.sequences.find(params[:id])
      end
    end
  end
end
