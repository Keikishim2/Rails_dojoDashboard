Rails.application.routes.draw do
  resources :dojo_controller
  get '/' => "dojo_controller#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
