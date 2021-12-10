Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "case_repositories#index"
  resources :case_repositories
  devise_for :user_data
  resources :user_data
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
