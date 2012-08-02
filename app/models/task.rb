class Task < ActiveRecord::Base
  attr_accessible :assigned_to_id, :completed_at, :created_by_id, :description, :todo_id

  belongs_to :todo
  belongs_to :user, foreign_key: :assigned_to_id
  # has_one :user, foreign_key: :assigned_to_id

  before_create :default_assigned_to_id

  validates_presence_of :created_by_id, :todo_id, :description

  def default_assigned_to_id
    self.assigned_to_id = self.created_by_id if self.assigned_to_id.nil?
  end
end

