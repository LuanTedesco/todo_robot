class SubTasksController < ApplicationController
  layout 'application_tasks'
  before_action :set_sub_task, only: %i[show edit update destroy]

  def index; end

  def show; end

  def new
    if user_signed_in?
      @sub_task = SubTask.new
    else
      redirect_to new_user_session_path
    end
  end

  def edit; end

  def create
    if user_signed_in?
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
    else
      redirect_to new_user_session_path
    end
  end

  def update
    if user_signed_in?
      if @sub_task.update(sub_task_params)
        redirect_to sub_tasks_path
        flash[:success] = 'Sub Task alterada com sucesso!'
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    if user_signed_in?
      @sub_task.destroy
      redirect_to sub_task_path
      flash[:success] = 'Sub Task apagada com sucesso!'
    else
      redirect_to new_user_session_path
    end
  end

  private

  def set_sub_task
    @sub_task = SubTask.find(params[:id])
  end

  def sub_task_params
    params.require(:sub_task).permit(:title, :finished)
  end
end
