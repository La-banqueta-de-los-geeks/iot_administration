Rails.application.routes.draw do
  scope "(:locale)", locale: /es|en/ do
    root "home#index"
    namespace :v1, :defaults => { :format => "json" } do
      resources :users do
        collection do
          post "login"
        end
      end
      resources :profiles
      resources :notes
      resources :posts do
        member do
          post :assign_challenge
          delete :unassign_challenge
        end
      end
      resources :rols
      resources :challenges
    end
  end
  mount Coverband::Reporters::Web.new, at: '/coverage' if ENV['RAILS_ENV']  != 'test'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
