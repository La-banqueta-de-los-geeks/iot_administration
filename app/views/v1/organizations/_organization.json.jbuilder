json.extract! organization, :id, :name, :created_at, :updated_at
json.token organization.token, partial: "v1/tokens/token", as: :token