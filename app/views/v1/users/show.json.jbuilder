json.user @user, partial: "v1/users/user", as: :user
json.token @token, partial: "v1/tokens/token", as: :token
json.organization @user.organization, partial: "v1/organizations/organization", as: :organization