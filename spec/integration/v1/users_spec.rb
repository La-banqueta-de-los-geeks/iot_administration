require "swagger_helper"

RSpec.describe "v1/users", type: :request do
  path "/v1/users" do
    post "create user" do
      tags "Users"
      consumes "application/json"
      response(201, "successful") do
        let(:locale) { "es" }
        parameter name: :params, in: :body, schema: { "$ref" => "#/components/schemas/user" }
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end
  path "/v1/users/login" do
    post "create user session" do
      tags "Users"
      consumes "application/json"
      response(200, "successful") do
        let(:locale) { "es" }
        parameter name: :params, in: :body, schema: { "$ref" => "#/components/schemas/user_login" }
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end
end
