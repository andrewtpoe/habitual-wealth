Rails.application.routes.draw do

  devise_for :users

  root 'home#index'

  get 'app', to: 'home#app'

  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
  get 'contribute', to: 'home#contribute'
  get 'terms', to: 'home#terms'
  get 'privacy_policy', to: 'home#privacy_policy'
  get 'robots.txt', to: 'home#robots'
  get 'sitemap.xml', to: 'home#sitemap', defaults: { format: 'xml' }

  get 'blog', to: 'posts#index'
  resources :post, except: [ :index ]

  namespace :api, defaults: { format: 'json' } do
    post 'log_in', to: 'users#log_in'
    post 'sign_up', to: 'users#sign_up'
  end
end
