require 'spec_helper'

describe "Shared pages" do
  subject { page }
  before { visit root_path }
  let(:user) { Fabricate(:user) }

  it { should have_selector('a', text: 'AllYourBase') }

  describe "navbar" do
    describe "when logged out" do
      it { should have_selector('a', text: 'Sign up') }
      it { should have_selector('a', text: 'Sign in') }
      it { should_not have_selector('a', text: 'Sign out') }
    end

    describe "when logged in" do
      before do
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should_not have_selector('a', text: 'Sign up') }
      it { should_not have_selector('a', text: 'Sign in') }
      it { should have_selector('a', text: 'Sign out') }
      it { should have_content(user.email) }

      describe "clicking on user email takes you to projects" do
        before { click_link user.email }

        it { should have_content('Projects') }
      end
    end
  end
end