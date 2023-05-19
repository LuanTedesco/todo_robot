class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    if params[:filter] == "today"
      @tasks = Task.today.today_ended
    elsif params[:filter] == "ended"
      @tasks = Task.ended
    else
      @tasks = Task.all
    end
    @tasks = @tasks.where("LOWER(title) LIKE ?", "%#{params[:filter_title].downcase}%") if params[:filter_title].present?
    @tasks = @tasks.where("start_date >= ?", params[:filter_start_date]) if params[:filter_start_date].present?
    @tasks = @tasks.where("end_date <= ?", params[:filter_end_date]) if params[:filter_end_date].present?
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Tarefa criada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Tarefa alterada com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
      redirect_to tasks_path, notice: "Tarefa excluída com sucesso!"
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :start_date, :end_date, :result, :priority, :status, :finished)
    end
end
