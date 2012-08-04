class TodosController < ApplicationController
  before_filter :confirm_signed_in

  def show
    @todo = Todo.find(params[:id])
    @task = @todo.tasks.new
  end

  def new
    @project = Project.find(params[:project_id])
    @todo = @project.todos.new
  end

  def create
    @project = Project.find(params[:project_id])
    @todo = @project.todos.new(params[:todo])
    if @todo.save
      respond_to do |format|
        format.html { redirect_to project_path(@project) }
        format.js { render 'projects/show', locals: { project: @project } }
      end
    else
      respond_to do |format|
        format.html { redirect_to project_path(@project) }
        format.js { render text: "alert('You suck... like a boss.')" }
      end
    end
  end

  private
    def confirm_signed_in
      if !user_signed_in?
        redirect_to new_user_session_path
      end
    end
end