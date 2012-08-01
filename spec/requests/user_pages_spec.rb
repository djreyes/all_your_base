require 'spec_helper'

describe "User pages" do
  subject { page }

  describe "sign_up page" do
    before { visit new_user_registration_path }

    it { should have_selector('h2', text: 'Sign up') }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button 'Sign up' }.not_to change(User, :count)
      end

      describe "submission without data" do
        before { click_button 'Sign up' }

        it { should have_content('error') }
        it { should have_selector('h2', text: 'Sign up') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Email", with: "me@example.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
      end

      it "should create the user" do
        expect { click_button 'Sign up'}.to change(User, :count).by(1)
      end
    end
  end
end