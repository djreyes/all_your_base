require 'spec_helper'

describe "Todo Pages" do
  subject { page }
  let(:project) { Fabricate(:project) }
  let(:user) { Fabricate(:user) }

  describe "todo#new" do
    describe "when logged out" do
      before { visit new_project_todo_path(project.id) }
      it { should have_content('Sign in') }
    end

    describe "when logged in" do
      before do
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
        visit new_project_todo_path(project.id)
      end
      it { should have_content('Create a Todo') }
      it { should have_content('Name') }

      describe "creates a new todo" do
        before do
          fill_in "Name", with: "Rumplestilskin"
        end
        it "with success" do
          expect { click_button "Create Todo" }.to change(Todo, :count).by(1)
        end
      end
    end
  end
end