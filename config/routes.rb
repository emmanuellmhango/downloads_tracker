Rails.application.routes.draw do
  get "/total_downloads", to: "downloads#total_downloads", as: :total_downloads
  resources :downloads, defaults: { format: :json }
  # Defines the root path route ("/")
  root to: "downloads#index", defaults: { format: :json }
end
