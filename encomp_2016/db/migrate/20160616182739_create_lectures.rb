class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :name
      t.text :description
      t.timestamp :start_time
      t.timestamp :end_time
      t.string :panelist

      t.timestamps null: false
    end
  end
end
