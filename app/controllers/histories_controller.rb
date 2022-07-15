class HistoriesController < ApplicationController

  def index
    histories = History.all
    render json: histories
  end

  def create
    history = History.new(
      history.task_id = params[:task_id],
      history.datetime = params[:datetime],
      history.boolean = params[:boolean]
    )
    if history.save
      render json: task, status: :created
    else
      render json: { errors: history.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def show
    history = History.find(params[:task_id])
    render json: history
  end

  def destroy
    history = History.find(params[:id])
    history.destroy
    render json: {message: "History successfully destroyed!"}
  end

end
