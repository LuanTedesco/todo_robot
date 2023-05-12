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
      redirect_to tasks_path, notice: "Tarefa editada com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
      redirect_to tasks_url, notice: "Tarefa apagada com sucesso!"
      head :no_content
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:tittle, :description, :start_date, :end_date, :result, :finished)
    end
end
