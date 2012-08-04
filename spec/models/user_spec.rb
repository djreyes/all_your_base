require 'spec_helper'

describe User do
  before { @user = Fabricate(:user) }
  subject { @user }

  it { should respond_to(:email) }
  it { should have_many(:projects) }
  pending { should have_many(:projects).through(:project_users) }


  it "should throw an error if a user doesn't have an email and password" do
    expect { User.create }.should raise_error
  end

  it "should create a user with an email and password" do
    User.create(email: "tester@example.com", password: "password", password_confirmation: "password").should be_valid
  end
end
