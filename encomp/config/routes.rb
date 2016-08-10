Rails.application.routes.draw do
  devise_for :users, path: "/admin"
  root to: "home#index"

  scope "/admin" do
    authenticated :user do
      root to: "home#admin_index", as: "admin_index"
    end
    root to: redirect("/admin/sign_in")
    resources :users, only: [ :index, :delete, :update ]
  end
end
