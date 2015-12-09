Rails.application.routes.draw do

  root 'home#index'

  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
  get 'contribute', to: 'home#contribute'
  get 'terms', to: 'home#terms'
  get 'privacy_policy', to: 'home#privacy_policy'
  get 'robots.txt', to: 'home#robots'
  get 'sitemap.xml', to: 'home#sitemap', defaults: { format: 'xml' }

  get 'blog', to: 'posts#index'
  resources :post, except: [ :index ]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }

end
