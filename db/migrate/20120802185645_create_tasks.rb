class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :assigned_to_id
      t.integer :created_by_id
      t.integer :todo_id
      t.datetime :completed_at

      t.timestamps
    end
  end
end
