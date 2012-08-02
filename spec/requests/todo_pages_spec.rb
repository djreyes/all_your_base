require 'spec_helper'

describe "Todo Pages" do
  subject { page }
  let(:user) { Fabricate(:user) }
  let(:project) { Fabricate(:project, owner_id: user.id) }

  describe "todo#new" do
    describe "when logged out" do
      before { visit new_project_todo_path(project.id) }
      it { should have_content('Sign in') }
    end

    describe "when logged in" do
      before do
        visit new_user_session_path
        fill_in "Email", with:  user.email
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

  describe "todo#show" do
    let(:todo) { Fabricate(:todo) }

    describe "when logged out" do
      before { visit project_path(todo.project) }

      it { should have_content("Sign in") }
    end

    describe "when logged in" do
      before do
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
        visit project_todo_path(todo.project, todo)
      end

      it { should have_content("Add Task") }

      describe "navigating to new tasks" do

        before { click_link "Add Task" }

        it { should have_content("Description") }
        it { should have_button("Create Task") }

        describe "creates a new task for the todo list" do
          before do
            fill_in "Description", with: "Holey Moley Guacamole"
          end
          it "with success" do
            expect { click_button "Create Task" }.to change(Task, :count).by(1)
          end
        end

      end

      describe "viewing existing tasks" do
        before do
          click_link "Add Task"
          fill_in "Description", with: "Holey Moley Guacamole"
          click_button "Create Task"
          click_link "Add Task"
          fill_in "Description", with: "Hit it again!"
          click_button "Create Task"
        end

        it { should have_content("Holey Moley Guacamole") }
        it { should have_content("Hit it again!") }
      end
    end
  end
end