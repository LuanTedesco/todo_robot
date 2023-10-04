class SubTasksController < ApplicationController
  layout 'application_tasks'
  before_action :authenticate_user!
  before_action :set_sub_task, only: %i[show edit update destroy]

  def index; end

  def show; end

  def new
      @sub_task = SubTask.new
  end

  def edit; end

  def create
      @task = Task.find(params[:task_id])
      @sub_task = current_user.sub_tasks.build(sub_task_params)
      @sub_task.task_id = @task.id

      if @sub_task.save
        redirect_to request.referrer || root_path
        flash[:success] = 'Sub Task criada com sucesso!'
      else
        redirect_to request.referrer || root_path
        flash[:error] = 'Título não preenchido'
      end
  end

  def update
      if @sub_task.update(sub_task_params)
        redirect_to sub_tasks_path
        flash[:success] = 'Sub Task alterada com sucesso!'
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
      @sub_task.destroy
      redirect_to sub_task_path
      flash[:success] = 'Sub Task apagada com sucesso!'
  end

  private

  def set_sub_task
    @sub_task = SubTask.find(params[:id])
  end

  def sub_task_params
    params.require(:sub_task).permit(:title, :finished)
  end
end
