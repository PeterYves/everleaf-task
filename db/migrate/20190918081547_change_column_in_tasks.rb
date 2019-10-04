class ChangeColumnInTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :status, :string, null: false
    
    change_column :tasks, :startdate, :datetime, null: false
    change_column :tasks, :enddate, :datetime, null: false
    change_column :tasks, :details, :string, null: false
  end
end
