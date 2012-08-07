class Todo < ActiveRecord::Base
  attr_accessible :created_by_id, :name, :project_id

  validates_presence_of :created_by_id, :name, :project_id
  validate :todo_owner_and_project_are_same

  belongs_to :user, foreign_key: :created_by_id
  belongs_to :project

  private
    def todo_owner_and_project_are_same
      # puts "Hello ma! #{self.created_by_id} #{self.project.owner_id}"
      if self.created_by_id != self.project.owner_id
        puts "#{self.created_by_id} #{self.project.owner_id}"
        errors.add(:created_by_id, "must be a project owner to create todos")
      end
    end

end
