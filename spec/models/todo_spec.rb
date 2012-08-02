require 'spec_helper'

describe Todo do
  let(:project) { Fabricate(:project) }

  it { should respond_to(:name) }
  it { should belong_to(:user) }
  it { should belong_to(:project) }

  describe "invalid todos" do
    it "should not create without a name" do
      expect { Todo.create(created_by_id: 1, project_id: 1) }.should raise_error
    end

    it "should not create without a created_by_id" do
      expect { Todo.create(name: "Yo man", project_id: 1) }.should raise_error
    end

    it "should not create without a project_id" do
      expect { Todo.create(name: "Yo man", created_by_id: 1) }.should raise_error
    end
  end

  describe "creating todos when you're not the project owner" do
    it "fails" do
      project.todos.create(created_by_id: (project.owner_id+1), name: "OH MY GOD").should_not be_valid
    end
  end

  describe "creatings todos when you're the project owner" do
    it "creates a todo successfully" do
      project.todos.create(created_by_id: project.owner_id, name: "OH MY GOD").should be_valid
    end
  end
end
