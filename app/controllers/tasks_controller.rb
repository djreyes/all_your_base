class TasksController < ApplicationController

  def new
    @todo = Todo.find(request.referer.split("/")[6])
    @task = @todo.tasks.new
  end

  def create
    @todo = Todo.find(params[:task][:todo_id]) #Need to figure out why we had to pass in todo_id in hidden field.  Hack. City.
    @task = @todo.tasks.new(params[:task])
    @todo.save
    redirect_to [@todo.project, @todo]
  end

end