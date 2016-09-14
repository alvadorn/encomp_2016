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
      post "/", to: "users#index", as: "user_list_search"
      patch "/pagamento/:id", to: "users#payment", as: "user_payment_confirm"
    end

    scope "/relatorios" do
      get "/", to: "reports#index", as: "reports_list"
      get "/camisas", to: "reports#show_shirts", as: "reports_shirt_size"
      get "/:type", to: "reports#show", as: "reports_show_tables"
    end

    scope "/email" do
      get "/", to: "mailer#index", as: "mailer_index"
      post "/enviar", to: "mailer#send_email", as: "mailer_send_email"
    end

  end
end
