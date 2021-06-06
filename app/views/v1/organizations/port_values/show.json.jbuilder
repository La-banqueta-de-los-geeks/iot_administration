json.user @user, partial: "v1/users/user", as: :user
json.organization @user.organization, partial: "v1/organizations/organization", as: :organization