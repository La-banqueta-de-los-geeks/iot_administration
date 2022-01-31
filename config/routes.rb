# == Route Map
#
# D, [2022-01-23T04:13:35.476826 #1641] DEBUG -- : using default configuration
#                                   Prefix Verb   URI Pattern                                                                              Controller#Action
#                                 rswag_ui        /api-docs                                                                                Rswag::Ui::Engine
#                                rswag_api        /api-docs                                                                                Rswag::Api::Engine
#                              sidekiq_web        /admin                                                                                   Sidekiq::Web
#                                                 /coverage                                                                                #<Coverband::Reporters::Web:0x00005611f7858860 @static=#<Rack::Static:0x00005611f4767df0 @app=#<Coverband::Reporters::Web:0x00005611f7858860 ...>, @urls=[/.*\.css/, /.*\.js/, /.*\.gif/, /.*\.png/], @index=nil, @gzip=nil, @cascade=nil, @header_rules=[], @file_server=#<Rack::Files:0x00005611f4767698 @root="/usr/local/bundle/gems/coverband-5.2.1/public", @headers={}, @default_mime="text/plain", @head=#<Rack::Head:0x00005611f4764290 @app=#<Proc:0x00005611f4764678 /usr/local/bundle/gems/rack-2.2.3/lib/rack/files.rb:33 (lambda)>>>>>
#                               v1_devices GET    (/:locale)/v1/devices(.:format)                                                          v1/devices#index {:format=>"json", :locale=>/es|en/}
#                                          POST   (/:locale)/v1/devices(.:format)                                                          v1/devices#create {:format=>"json", :locale=>/es|en/}
#                                v1_device PATCH  (/:locale)/v1/devices/:id(.:format)                                                      v1/devices#update {:format=>"json", :locale=>/es|en/}
#                                          PUT    (/:locale)/v1/devices/:id(.:format)                                                      v1/devices#update {:format=>"json", :locale=>/es|en/}
# v1_devices_device_group_device_sequences POST   (/:locale)/v1/devices/device_groups/:device_group_id/device_sequences(.:format)          v1/devices/device_sequences#create {:format=>"json", :locale=>/es|en/}
#  v1_devices_device_group_device_sequence PATCH  (/:locale)/v1/devices/device_groups/:device_group_id/device_sequences/:id(.:format)      v1/devices/device_sequences#update {:format=>"json", :locale=>/es|en/}
#                                          PUT    (/:locale)/v1/devices/device_groups/:device_group_id/device_sequences/:id(.:format)      v1/devices/device_sequences#update {:format=>"json", :locale=>/es|en/}
#                 v1_devices_device_groups POST   (/:locale)/v1/devices/device_groups(.:format)                                            v1/devices/device_groups#create {:format=>"json", :locale=>/es|en/}
#                  v1_devices_device_group PATCH  (/:locale)/v1/devices/device_groups/:id(.:format)                                        v1/devices/device_groups#update {:format=>"json", :locale=>/es|en/}
#                                          PUT    (/:locale)/v1/devices/device_groups/:id(.:format)                                        v1/devices/device_groups#update {:format=>"json", :locale=>/es|en/}
#                  v1_devices_device_ports GET    (/:locale)/v1/devices/device_ports(.:format)                                             v1/devices/device_ports#index {:format=>"json", :locale=>/es|en/}
#                                          POST   (/:locale)/v1/devices/device_ports(.:format)                                             v1/devices/device_ports#create {:format=>"json", :locale=>/es|en/}
#                   v1_devices_device_port PATCH  (/:locale)/v1/devices/device_ports/:id(.:format)                                         v1/devices/device_ports#update {:format=>"json", :locale=>/es|en/}
#                                          PUT    (/:locale)/v1/devices/device_ports/:id(.:format)                                         v1/devices/device_ports#update {:format=>"json", :locale=>/es|en/}
#             v1_organizations_port_values GET    (/:locale)/v1/organizations/port_values(.:format)                                        v1/organizations/port_values#index {:format=>"json", :locale=>/es|en/}
#                                          POST   (/:locale)/v1/organizations/port_values(.:format)                                        v1/organizations/port_values#create {:format=>"json", :locale=>/es|en/}
#                           login_v1_users POST   (/:locale)/v1/users/login(.:format)                                                      v1/users#login {:format=>"json", :locale=>/es|en/}
#                                 v1_users POST   (/:locale)/v1/users(.:format)                                                            v1/users#create {:format=>"json", :locale=>/es|en/}
#            rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#               rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#            rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#      rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#            rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#             rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#           rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                          POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#            rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                          PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                          PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                          DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
#    rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                       rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#                rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#                update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
#
# Routes for Rswag::Ui::Engine:
#
#
# Routes for Rswag::Api::Engine:

require "sidekiq/web"
Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  mount Sidekiq::Web => "/admin" # mount Sidekiq::Web in your Rails app
  mount Coverband::Reporters::Web.new, at: "/coverage" if Rails.env.development?
  scope "(:locale)", locale: /es|en/ do
    namespace :v1, :defaults => { :format => "json" } do
      resources :devices, only: %i[create update index]
      namespace :devices do
        resources :device_groups, only: %i[index create update] do
          resources :device_sequences, only: %i[create update index] do
            resources :sequences, only: %i[create update index]
          end
        end
        resources :device_ports, only: %i[create index update]
      end
      namespace :organizations do
        resources :port_values, only: %i[create index]
      end
      resources :users, only: %i[create] do
        collection do
          post "login"
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
