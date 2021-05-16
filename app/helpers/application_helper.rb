# frozen_string_literal: true

module ApplicationHelper
  def payload_crud
    JSON.parse(response.body, symbolize_names: true)
  end
end
