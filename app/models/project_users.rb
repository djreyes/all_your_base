class ProjectUsers < ActiveRecord::Base
  attr_accessible :is_admin, :project_id, :user_id
  validates_presence_of :project_id, :user_id

  belongs_to :user
  belongs_to :project

  after_create :make_nil_is_admin_false

  private
    def make_nil_is_admin_false
      (self.is_admin = false) if (self.is_admin == nil)
    end
end
