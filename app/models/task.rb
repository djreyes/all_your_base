class Task < ActiveRecord::Base
  attr_accessible :assigned_to_id, :completed_at, :created_by_id, :description, :todo_id
end
