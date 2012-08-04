class ProjectsController < ApplicationController
  before_filter :confirm_signed_in

  def index
    @user = current_user
    @project = Project.new
    @projects = current_user.projects
  end

  def new
    @user = current_user
    @project = current_user.projects.new
  end

  def create
    @user = current_user.projects.new(params[:project])
    @projects = current_user.projects
    if @user.save
      respond_to do |format|
        format.js   { render 'projects/projects', locals: { projects: @projects } }
        format.html { redirect_to projects_path }
      end
    end
  end

  def show
    @todo = Todo.new
    @project = Project.find(params[:id])
    confirm_owner
  end

  private
    def confirm_signed_in
      if !user_signed_in?
        redirect_to new_user_session_path
      end
    end

    def confirm_owner
      if @project.owner_id != current_user.id
        flash[:error] = "You don't have permission to view that project"
        redirect_to projects_path
      end
    end
end