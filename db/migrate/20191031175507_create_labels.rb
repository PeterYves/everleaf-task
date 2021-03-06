class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true
      t.references :task, foreign_key: true
    end
  end
end
