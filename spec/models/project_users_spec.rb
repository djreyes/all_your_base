require 'spec_helper'

describe ProjectUsers do
  before do
    @admin = Fabricate(:project_user_admin)
    @member = Fabricate(:project_user_member)
  end

  subject { @admin }

  it { should validate_presence_of(:project_id) }
  it { should validate_presence_of(:user_id) }

  it { should respond_to(:project_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:is_admin) }

  it { should belong_to(:project) }
  it { should belong_to(:user) }

  it "stores non-admin false in is_admin" do
    @member.is_admin.should equal false
    @member.is_admin.should_not be_nil
  end

  describe "creating project users at project creation" do
    before do
      @user = User.create(email: "p@example.com", password: "password")
      @project = @user.projects.create(name: "Musharev", description: "is a funny name")
    end
    it "automatically creates a project admin from a new project" do
      ProjectUsers.where("project_id = ? AND user_id = ?", @project.id, @user.id).should_not be_empty
    end

    describe "adding users to a project" do
      before do
        @another_user = Fabricate(:user) #User.create(email: "pap@example.com", password: "password")
        @another_project = @user.projects.create(name: "Meatball", description: "is a funny name")
      end
      it "adds a user to an existing project" do
        @project.project_users.create(user_id: 1).should be_valid
      end

    end
  end

end
