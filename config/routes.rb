Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get "/login", to: "users#login"
    get "/register", to: "users#new"
    post "/users", to: "users#create"
end
