class CreateProjectUsers < ActiveRecord::Migration
  def change
    create_table :project_users do |t|
      t.integer :user_id
      t.integer :project_id
      t.boolean :is_admin

      t.timestamps
    end
  end
end
