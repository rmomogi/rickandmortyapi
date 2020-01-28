require 'sidekiq/web'
Rails.application.routes.draw do
  mount ::V1::Base => '/'
  mount Sidekiq::Web => '/sidekiq'
end
