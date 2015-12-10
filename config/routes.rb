Rails.application.routes.draw do

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

  post 'sign_up', to: 'users#sign_up'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    # passwords: 'users/passwords',
    # confirmations: 'users/confirmations',
    # unlocks: 'users/unlocks'
  }

end
