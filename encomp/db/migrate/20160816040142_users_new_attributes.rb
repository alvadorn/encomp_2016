class UsersNewAttributes < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :needs_republic
      t.string :accomodation
      t.string :shirt, default: "P-Masculino"
      t.string :cpf, nil: false
      t.string :phone
      t.string :address
      t.string :university
      t.string :course
      t.integer :payment_preference, default: 0
    end
  end
end
