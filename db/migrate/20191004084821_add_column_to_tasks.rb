class AddColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :created_at, :datetime, default: -> {'NOW()'}
  end
end
