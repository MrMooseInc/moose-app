class TasksController < ApplicationController
  def index
    tasks = Task.all
    render json: tasks
  end

  def create
    tasks = Task.new(
      name: params[:name],
      doses_required: params[:doses_required],
      doses_given:params[:doses_given]
    )
    if task.save
      render json: task, status: :created
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def show
    task = Task.find(params[:id])
    render json: task
  end

  def update
    task = Task.find(params[:id])
    task.name = params[:name] || task.name
    task.doses_required = params[:doses_required] || task.doses_required
    task.doses_given = params[:doses_given] || task.doses_given
    if task.save
      render json: task, status: :created
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessible_entity
    end
  end 
  
  def destroy
    task = Task.find(params[:id]) 
    task.destroy
    render json: {message: "Task successfully destroyed!"}
  end



end
