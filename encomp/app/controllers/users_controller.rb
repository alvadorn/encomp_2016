class UsersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
  end

  def delete
  end

  def update

  end
end
