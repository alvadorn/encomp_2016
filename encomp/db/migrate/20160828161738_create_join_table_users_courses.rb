class CreateJoinTableUsersCourses < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :courses do |t|
      t.integer :user_id
      t.integer :course_id
    end
  end
end
