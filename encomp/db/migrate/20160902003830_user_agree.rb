class UserAgree < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.boolean :terms_agree
    end
  end
end
