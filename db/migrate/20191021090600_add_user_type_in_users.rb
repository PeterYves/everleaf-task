class AddUserTypeInUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_type, :string, default: 'general user'
  end
end
