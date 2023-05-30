class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    filter
    filter_index
  end

  def filter
    @tasks = if params[:filter] == 'today_tasks'
               Task.today.today_ended.task
             elsif params[:filter] == 'ended_tasks'
               Task.ended.task
             elsif params[:filter] == 'tasks'
               Task.task
             elsif params[:filter] == 'today_robots'
               Task.today.today_ended.robot
             elsif params[:filter] == 'ended_robots'
               Task.ended.robot
             elsif params[:filter] == 'robots'
               Task.robot
             elsif params[:filter] == 'aguardando'
               Task.aguardando
             elsif params[:filter] == 'desenvolvendo'
               Task.desenvolvendo
             elsif params[:filter] == 'testando'
               Task.testando
             elsif params[:filter] == 'concluido'
               Task.concluido
             elsif params[:filter] == 'rodando'
               Task.rodando
             else
               Task.all
             end
  end

  def filter_index
    if params[:filter_title].present?
      @tasks = @tasks.where('LOWER(title) LIKE ?',
                            "%#{params[:filter_title].downcase}%")
    end
    @tasks = @tasks.where('start_date >= ?', params[:filter_start_date]) if params[:filter_start_date].present?
    @tasks = @tasks.where('end_date <= ?', params[:filter_end_date]) if params[:filter_end_date].present?
    @tasks = @tasks.where(priority: params[:filter_priority]) if params[:filter_priority].present?
    @tasks = @tasks.where(status: params[:filter_status]) if params[:filter_status].present?
    @tasks = @tasks.where(typetask: params[:filter_typetask]) if params[:filter_typetask].present?
    @tasks = @tasks.order(priority: :desc, finished: :desc)
  end
end

def show; end

def new
  @task = Task.new
end

def edit; end

def create
  @task = Task.new(task_params)
  if @task.save
    redirect_to tasks_path, notice: 'Tarefa criada com sucesso!'
  else
    render :new, status: :unprocessable_entity
  end
end

def fast_task
  @task = Task.new(task_params)
  @task.start_date = Date.today
  @task.end_date = Date.today

  if @task.save
    redirect_to tasks_path, notice: 'Tarefa criada com sucesso!'
  else
    render :new, status: :unprocessable_entity
  end
end

def update
  if @task.update(task_params)
    redirect_to tasks_path, notice: 'Tarefa alterada com sucesso!'
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @task.destroy
  redirect_to tasks_path, notice: 'Tarefa excluída com sucesso!'
end

  private

def set_task
  @task = Task.find(params[:id])
end

def task_params
  params.require(:task).permit(:title, :description, :start_date, :end_date, :result, :priority, :status, :typetask,
                               :finished)
end
