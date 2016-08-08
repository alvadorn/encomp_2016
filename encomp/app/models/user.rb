class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable


  def is_admin?
    self.admin
  end

  def is_auxiliar?
    self.auxiliar
  end

  def paid?
    self.paid
  end

  def exists?
    self.removed
  end
end
