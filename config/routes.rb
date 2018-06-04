require 'site_version_constraint'

Rails.application.routes.draw do

  
  root 'site/home#index'

  namespace :site, defaults: {format: :json}, subdomain: `site`, path: "/" do
    namespace :v1, path: "/", constraint: SiteVersionConstraint.new(version: 1, default: true) do
    end
  end

  namespace :location do
    resources :admins, except: [:show]
    resources :branches, except: [:show] do
      resources :taxes , except: [:show]
    end
    resources :composition_products, except: [:show] do
      resources :information_coverages, except: [:show]
      get 'information_coverages/update_status/:id' => 'information_coverages#update_status', as: :information_coverages_update_status
    end
    resources :covers , except: [:show]
    resources :deadline_short_longs, except: [:show]
    resources :group_branches, except: [:show]
    resources :insurers, except: [:show]
    resources :percent_deadlines, except: [:show]
    get 'deadline_short_longs/update_status/:id' => 'deadline_short_longs#update_status', as: :deadline_short_longs_update_status
    resources :products, except: [:show] do
      resources :information_products, except: [:show]
    end

    
    get 'dashboard', to: 'dashboard#index'
    # get 'information_products/:id', controller: 'information_products', action: 'index', as: 'products_locacion_information_products'
    # get 'information_products/:id/new', controller: 'information_product', action: 'new', as: 'products_new_locacion_information_product'
  end

  namespace :site do
    get 'home', to: 'home#index'
  end

  get 'location', to: 'location/dashboard#index'

  namespace :location do
    get 'dashboard', to: 'dashboard#index'
  end

  devise_for :admins, :skip => [:registrations]
  devise_for :members

 
end
