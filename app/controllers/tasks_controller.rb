class TasksController < ApplicationController

  def new
    @todo = Todo.find(request.referer.split("/")[6])
    @task = @todo.tasks.new
  end

  def create
    @todo = Todo.find(params[:task][:todo_id]) #Need to figure out why we had to pass in todo_id in hidden field.  Hack. City.
    @task = @todo.tasks.new(params[:task])

    if @todo.save
      respond_to do |format|
        format.html { redirect_to [@todo.project, @todo] }
        format.js { render 'todos/show', locals: {todo: @todo} }
      end
    else
      respond_to do |format|
        format.html { redirect_to [@todo.project, @todo] }
        format.js { render text: "alert('You suck... like a boss.')" }
      end
    end
  end

end