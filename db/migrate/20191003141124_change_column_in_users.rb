class ChangeColumnInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :Admin, :boolean, :default => false
  end
end
