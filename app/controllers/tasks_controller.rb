class TasksController < ApplicationController
  def index
    tasks = Task.all.order(:id)
    render json: tasks
  end

  def create
    task = Task.new(
      name: params[:name],
      doses_required: params[:doses_required],
      doses_given: 0
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
    if task.doses_given > 0
      history = History.new(
        task_id: task.id,
        all_tasks_completed: (task.doses_given >= task.doses_required)
      )
    end
    if task.save && history.save
      render json: {task: task , history: history}, status: :created
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def add_dose
    task = Task.find(params[:id])
    task.doses_given += 1
    history = History.new(
      task_id: task.id,
      all_tasks_completed: (task.doses_given >= task.doses_required)
    )
    if task.save && history.save
      render json: {task: task , history: history}, status: :created
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessible_entity
    end
  end
    
  def remove_dose
    task = Task.find(params[:id])
    if task.doses_given > 0
      task.doses_given -= 1
    end
    if task.save
      HistoriesController.new.destroy(params[:id])
      render json: {task: task}, status: :ok
    else 
      render json: {errors: task.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def destroy
    task = Task.find(params[:id]) 
    task.destroy
    render json: {message: "Task successfully destroyed!"}
  end

end
