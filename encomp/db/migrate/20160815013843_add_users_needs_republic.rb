class AddUsersNeedsRepublic < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.boolean :needs_republic, default: false
    end
  end
end
