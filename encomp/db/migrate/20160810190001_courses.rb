class Courses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name, default: ""
      t.text :desc, default: ""
      t.timestamps null: false
      t.date :day, null: false
    end
  end
end
