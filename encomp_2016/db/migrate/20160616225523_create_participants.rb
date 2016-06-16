class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :full_name
      t.string :email
      t.string :cpf
      t.string :shirt

      t.timestamps null: false
    end
  end
end
