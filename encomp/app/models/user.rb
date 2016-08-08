class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    @admin
  end

  def is_auxiliar?
    @auxiliar
  end

  def paid?
    @paid
  end

  def exists?
    !@removed
  end
end
