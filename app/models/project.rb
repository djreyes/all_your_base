class Project < ActiveRecord::Base
  attr_accessible :description, :name, :owner_id
  validates_presence_of :name, :owner_id

  belongs_to :user, foreign_key: :owner_id

  has_many :todos
  has_many :project_users
  has_many :users, through: :project_users

  after_create :add_owner_to_project_users

  private
    def add_owner_to_project_users
      ProjectUsers.create(user_id: self.owner_id, is_admin: true, project_id: self.id)
    end
end
