class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :project_id
      t.string :name
      t.integer :created_by_id

      t.timestamps
    end
  end
end
