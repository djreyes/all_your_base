require 'spec_helper'

describe Task do
  let(:task) { Fabricate(:task) }
  subject { task }

  it { should belong_to(:todo) }
  it { should belong_to(:user) } #assigned_to_id
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:created_by_id) }
  it { should validate_presence_of(:todo_id) }

  describe "no user assigned on create" do
    before { @new_task = Fabricate(:task, assigned_to_id: nil) }

    it "can't have nil for a assigned_by_id" do
      @new_task.assigned_to_id.should_not eq nil
    end

    it "is automatically assigned to the user that creates it" do
      @new_task.assigned_to_id.should eq @new_task.created_by_id
    end
  end
end
