Rails.application.routes.draw do
  #devise_scope :user do
  #  get "/registro" => "users/registrations#new_inscription", as: :inscription_registration
  #  post "/registro" => "users/registrations#create", as: :inscription_create
  #end

  devise_for :users,
              path: "/admin",
              :skip => [:passwords, :registrations],
              :controllers => { :registrations => "users/registrations" }
  root to: "home#index"

  get "inscricao", to: "users#new", as: "user_inscription"
  post "inscricao", to: "users#create", as: "user_create"

  scope "/admin" do
    authenticated :user do
      root to: "home#admin_index", as: "admin_index"
    end
    root to: redirect("/admin/sign_in")

    scope "/inscritos" do
      get "/", to: "users#index", as: "user_list"
    end

  end
end
