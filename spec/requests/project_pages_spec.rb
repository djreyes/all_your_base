require 'spec_helper'

describe "Project pages" do
  subject { page }
  let(:user) { Fabricate(:user) }
  let(:user1) { Fabricate(:user) }

  describe "projects#index" do

    describe "when logged out" do
      before { visit projects_path }
      it { should have_content('Sign in') }
    end

    describe "when logged in" do
      before do
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end
      it { should have_content('Projects') }
      it { should have_selector('a', text: 'Add Project') }

      describe "'Add Project' directs to new project page" do
        before { click_link "Add Project" }
        it { should have_content('New Project') }
      end
    end
  end

  describe "projects#new" do

    describe "when logged out" do
      before { visit new_project_path }
      it { should_not have_content('New') }
    end

    describe "when logged in" do
      before do
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
        click_link 'Add Project'
      end
      it { should have_content('New') }
      it { should have_content('Name') }
      it { should have_content('Description') }

      describe "'New Project' creates a new project in the database" do
        before do
          fill_in "Name", with: "Googly Moogly"
          fill_in "Description", with: "F'in things up!"
        end

        it "should create the project" do
          expect { click_button 'Create Project'}.to change(Project, :count).by(1)
        end

        describe "displays the project in the list of projects" do
          before { click_button 'Create Project' }
          it { should have_content("Googly Moogly") }
          it { should have_content("F'in things up!") }
        end
      end
    end
  end

  describe "projects#show" do
    let(:project) { Fabricate(:project, name: "Can you see me now?", owner_id: user.id) }

    describe "when logged out" do
      before { visit project_path(project.id) }

      it { should have_content("Sign in") }
    end

    describe "when logged in as someone else" do
      before do
        visit new_user_session_path
        fill_in "Email", with: user1.email
        fill_in "Password", with: user1.password
        click_button "Sign in"
        visit project_path(project.id)
      end

      it { should have_content("You don't have permission to view that project") }
    end

    describe "when logged in" do
      before do
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
        visit project_path(project.id) #Need to be able to click on link rather than navigating explicitly
      end

      it { should have_content("Can you see me now?") }
      it { should have_content(project.description) }
      it { should have_content('Add Project Todo') }

      describe "clicking on todos" do
        let(:project) { Fabricate(:project, name: "Can you see me now?", owner_id: user.id) }

        before do
          visit project_path(project.id)
          click_link "Add Project Todo"
          fill_in "Name", with: "Tommy likey, tommy want wingy"
          click_button "Create Todo"
          visit project_path(project.id)
        end
        it { should have_link("Tommy likey, tommy want wingy") }
      end
    end
  end
end