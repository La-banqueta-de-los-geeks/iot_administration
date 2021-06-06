module V1
  module Organizations
    class PortValuesController < ApplicationController
      before_action :authenticate!
      def index
        @port_values = @current_organization.port_values.where(organization_id: @current_organization.id)
      end

      def create
        @port_value = @current_organization.port_values.new port_value_params
        if @port_value.valid?
          @port_value.save
          render :show, status: :created
        else
          render json: { errors: @port_value.errors.messages }, status: :bad_request
        end
      end

      private

      def port_value_params
        params.require(:port_value).permit(:name, :value)
      end
    end
  end
end
