class UsersController < ApplicationController
  before_action :authenticate_user!, only: :index

  layout "admin", except: [ :new, :create ]

  def index
  end

  def delete
  end

  def update

  end
end
