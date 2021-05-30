json.extract! user, :id, :email, :created_at, :updated_at
json.token user.token, partial: "v1/tokens/token", as: :token
