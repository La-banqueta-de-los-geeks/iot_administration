# == Route Map
#
# E, [2021-05-14T05:05:13.411738 #157] ERROR -- : coverage failed to store
# E, [2021-05-14T05:05:13.411796 #157] ERROR -- : Coverband Error: #<Redis::CannotConnectError: Error connecting to Redis on 127.0.0.1:6379 (Errno::ECONNREFUSED)> Error connecting to Redis on 127.0.0.1:6379 (Errno::ECONNREFUSED)
# D, [2021-05-14T05:05:13.435671 #157] DEBUG -- : using default configuration
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                              rswag_ui        /api-docs                                                                                Rswag::Ui::Engine
#                             rswag_api        /api-docs                                                                                Rswag::Api::Engine
#                           sidekiq_web        /sidekiq                                                                                 Sidekiq::Web
#                                  root GET    /(:locale)(.:format)                                                                     home#index {:locale=>/es|en/}
#                        login_v1_users POST   (/:locale)/v1/users/login(.:format)                                                      v1/users#login {:format=>"json", :locale=>/es|en/}
#                              v1_users GET    (/:locale)/v1/users(.:format)                                                            v1/users#index {:format=>"json", :locale=>/es|en/}
#                                       POST   (/:locale)/v1/users(.:format)                                                            v1/users#create {:format=>"json", :locale=>/es|en/}
#                               v1_user GET    (/:locale)/v1/users/:id(.:format)                                                        v1/users#show {:format=>"json", :locale=>/es|en/}
#                                       PATCH  (/:locale)/v1/users/:id(.:format)                                                        v1/users#update {:format=>"json", :locale=>/es|en/}
#                                       PUT    (/:locale)/v1/users/:id(.:format)                                                        v1/users#update {:format=>"json", :locale=>/es|en/}
#                                       DELETE (/:locale)/v1/users/:id(.:format)                                                        v1/users#destroy {:format=>"json", :locale=>/es|en/}
#                           v1_profiles GET    (/:locale)/v1/profiles(.:format)                                                         v1/profiles#index {:format=>"json", :locale=>/es|en/}
#                                       POST   (/:locale)/v1/profiles(.:format)                                                         v1/profiles#create {:format=>"json", :locale=>/es|en/}
#                            v1_profile GET    (/:locale)/v1/profiles/:id(.:format)                                                     v1/profiles#show {:format=>"json", :locale=>/es|en/}
#                                       PATCH  (/:locale)/v1/profiles/:id(.:format)                                                     v1/profiles#update {:format=>"json", :locale=>/es|en/}
#                                       PUT    (/:locale)/v1/profiles/:id(.:format)                                                     v1/profiles#update {:format=>"json", :locale=>/es|en/}
#                                       DELETE (/:locale)/v1/profiles/:id(.:format)                                                     v1/profiles#destroy {:format=>"json", :locale=>/es|en/}
#                              v1_notes GET    (/:locale)/v1/notes(.:format)                                                            v1/notes#index {:format=>"json", :locale=>/es|en/}
#                                       POST   (/:locale)/v1/notes(.:format)                                                            v1/notes#create {:format=>"json", :locale=>/es|en/}
#                               v1_note GET    (/:locale)/v1/notes/:id(.:format)                                                        v1/notes#show {:format=>"json", :locale=>/es|en/}
#                                       PATCH  (/:locale)/v1/notes/:id(.:format)                                                        v1/notes#update {:format=>"json", :locale=>/es|en/}
#                                       PUT    (/:locale)/v1/notes/:id(.:format)                                                        v1/notes#update {:format=>"json", :locale=>/es|en/}
#                                       DELETE (/:locale)/v1/notes/:id(.:format)                                                        v1/notes#destroy {:format=>"json", :locale=>/es|en/}
#              assign_challenge_v1_post POST   (/:locale)/v1/posts/:id/assign_challenge(.:format)                                       v1/posts#assign_challenge {:format=>"json", :locale=>/es|en/}
#            unassign_challenge_v1_post DELETE (/:locale)/v1/posts/:id/unassign_challenge(.:format)                                     v1/posts#unassign_challenge {:format=>"json", :locale=>/es|en/}
#                              v1_posts GET    (/:locale)/v1/posts(.:format)                                                            v1/posts#index {:format=>"json", :locale=>/es|en/}
#                                       POST   (/:locale)/v1/posts(.:format)                                                            v1/posts#create {:format=>"json", :locale=>/es|en/}
#                               v1_post GET    (/:locale)/v1/posts/:id(.:format)                                                        v1/posts#show {:format=>"json", :locale=>/es|en/}
#                                       PATCH  (/:locale)/v1/posts/:id(.:format)                                                        v1/posts#update {:format=>"json", :locale=>/es|en/}
#                                       PUT    (/:locale)/v1/posts/:id(.:format)                                                        v1/posts#update {:format=>"json", :locale=>/es|en/}
#                                       DELETE (/:locale)/v1/posts/:id(.:format)                                                        v1/posts#destroy {:format=>"json", :locale=>/es|en/}
#                               v1_rols GET    (/:locale)/v1/rols(.:format)                                                             v1/rols#index {:format=>"json", :locale=>/es|en/}
#                                       POST   (/:locale)/v1/rols(.:format)                                                             v1/rols#create {:format=>"json", :locale=>/es|en/}
#                                v1_rol GET    (/:locale)/v1/rols/:id(.:format)                                                         v1/rols#show {:format=>"json", :locale=>/es|en/}
#                                       PATCH  (/:locale)/v1/rols/:id(.:format)                                                         v1/rols#update {:format=>"json", :locale=>/es|en/}
#                                       PUT    (/:locale)/v1/rols/:id(.:format)                                                         v1/rols#update {:format=>"json", :locale=>/es|en/}
#                                       DELETE (/:locale)/v1/rols/:id(.:format)                                                         v1/rols#destroy {:format=>"json", :locale=>/es|en/}
#                         v1_challenges GET    (/:locale)/v1/challenges(.:format)                                                       v1/challenges#index {:format=>"json", :locale=>/es|en/}
#                                       POST   (/:locale)/v1/challenges(.:format)                                                       v1/challenges#create {:format=>"json", :locale=>/es|en/}
#                          v1_challenge GET    (/:locale)/v1/challenges/:id(.:format)                                                   v1/challenges#show {:format=>"json", :locale=>/es|en/}
#                                       PATCH  (/:locale)/v1/challenges/:id(.:format)                                                   v1/challenges#update {:format=>"json", :locale=>/es|en/}
#                                       PUT    (/:locale)/v1/challenges/:id(.:format)                                                   v1/challenges#update {:format=>"json", :locale=>/es|en/}
#                                       DELETE (/:locale)/v1/challenges/:id(.:format)                                                   v1/challenges#destroy {:format=>"json", :locale=>/es|en/}
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
#
# Routes for Rswag::Ui::Engine:
#
#
# Routes for Rswag::Api::Engine:

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app
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
  #mount Coverband::Reporters::Web.new, at: '/coverage' if ENV['RAILS_ENV']  != 'test'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
