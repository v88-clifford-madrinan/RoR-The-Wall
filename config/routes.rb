Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    # ROUTES FOR USER
    get "/login", to: "users#login"
    get "/register", to: "users#new"
    post "/users", to: "users#create"
    post "/users/validate_login", to: "users#validate_login"
    get "/logout", to: "users#logout"

    # ROUTES FOR MESSAGE
    post "/messages", to: "messages#create"
    delete "/messages/:id", to: "messages#destroy"
    
    # ROUTES FOR COMMENT
    post "/comments", to: "comments#create"

    root "messages#index"
end
