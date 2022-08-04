class HistoriesController < ApplicationController

  def index
    histories = History.all
    render json: histories
  end

  def create
    history = History.new(
      task_id: params[:task_id],
      time_completed: params[:time_completed],
      all_tasks_completed: params[:all_tasks_completed]
    )
    if history.save
      render json: history, status: :created
    else
      render json: { errors: history.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def show
    history = History.where(task_id: params[:id])
    render json: history
  end

  def destroy
    history = Task.find(params[:id]).histories.last
    history.destroy
    render json: {message: "History successfully destroyed!"}
  end

end
