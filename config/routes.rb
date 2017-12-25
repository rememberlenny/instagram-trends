Rails.application.routes.draw do
  get 'image_viewer' => 'image_viewer#index', as: 'image_viewers'
  get 'image_viewer/:shortcode' => 'image_viewer#show', as: 'image_viewer'

  get 'instagram/login'
  get 'instagram/redirect_url' => 'instagram#store_session', as: "instagram_session"

  mount Sidekiq::Web => "/sidekiq" # monitoring console

  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
