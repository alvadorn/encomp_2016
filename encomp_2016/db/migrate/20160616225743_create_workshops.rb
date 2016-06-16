class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :name
      t.timestamp :start_time
      t.timestamp :end_time
      t.text :description

      t.timestamps null: false
    end
  end
end
