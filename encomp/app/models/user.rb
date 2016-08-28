class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  validates_presence_of [:name, :cpf, :phone, :university, :course]
  has_and_belongs_to_many :courses


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

  rails_admin do
    list do
      field(:name) { label "Nome" }
      field :email
      field(:paid) { label "Pago" }
    end
    edit do
      group :default do
          label "Usuarios"
        field :name do
          label "Nome"
        end
      end
    end
  end
end
