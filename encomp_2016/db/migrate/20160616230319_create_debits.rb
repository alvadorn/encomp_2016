class CreateDebits < ActiveRecord::Migration
  def change
    create_table :debits do |t|
      t.name :description
      t.real :value
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
