require 'spec_helper'

describe User do
  before { @user = Fabricate(:user) }
  subject { @user }

  it { should respond_to(:email) }
  it { should have_many(:projects) }

  it "should throw an error if a user doesn't have an email and password" do
    expect { User.create }.should raise_error
  end

  it "should create a user with an email and password" do
    User.create(:email => "test@example.com", :password => "password").should be_valid
  end
end
