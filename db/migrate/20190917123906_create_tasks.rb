class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :details
      t.string :status
      t.string :priority
      t.datetime :startdate
      t.datetime :enddate
    end
  end
end
