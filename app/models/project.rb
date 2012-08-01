class Project < ActiveRecord::Base
  attr_accessible :description, :name, :owner_id
  validates_presence_of :name, :owner_id

  belongs_to :user, :foreign_key => :owner_id
end
