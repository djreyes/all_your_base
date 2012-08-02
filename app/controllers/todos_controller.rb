class TodosController < ApplicationController
  before_filter :confirm_signed_in

  def new
    @project = Project.find(params[:project_id])
    @todo = @project.todos.new
  end

  def create
    @project = Project.find(params[:project_id])
    @todo = @project.todos.new(params[:todo])
    @todo.save
    redirect_to projects_path
  end

  private
    def confirm_signed_in
      if !user_signed_in?
        redirect_to new_user_session_path
      end
    end
end