require 'spec_helper'

describe Project do
  before { @project = Fabricate(:project) }
  subject { @project }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:owner_id) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should belong_to(:user) }
  # it { should have_many(:users).through(:project_users) }

  it "should throw an error if a project doesn't have an owner, name, and description" do
    expect { Project.create }.should raise_error
  end

  it "should create a project with an owner, name, and description" do
    Project.create(:owner_id => 1, :name => "bubkiss", :description => "is a great word").should be_valid
  end

end
