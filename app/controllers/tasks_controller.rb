class TasksController < ApplicationController
  layout 'application_tasks'
  before_action :set_task, only: %i[show edit update destroy]

  def index
    if user_signed_in?
      filter_tasks
      apply_filters
      order_tasks
    else
      redirect_to new_user_session_path
    end
  end

  def show; end

  def new
    if user_signed_in?
      @task = Task.new
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    if user_signed_in?
    @task = Task.find(params[:id])
    @sub_tasks = current_user.sub_tasks.where(task_id: @task.id)
    else
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
      @task = current_user.tasks.build(task_params)
      if @task.save
        set_type_task
        redirect_to request.referrer || root_path
        flash[:success] = "#{@type_task} criad#{@sex} com sucesso!"
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_path
    end
  end

  def fast_task
    if user_signed_in?
      @task = current_user.tasks.build(task_params)
      @task.start_date = Date.today
      @task.end_date = Date.today

      if @task.save
        set_type_task
        redirect_to request.referrer || root_path
        flash[:success] = "#{@type_task} criad#{@sex} com sucesso!"
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
      if @task.update(task_params)
        set_type_task
        redirect_to request.referrer || root_path
        flash[:success] = "#{@type_task} alterad#{@sex} com sucesso!"
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    if user_signed_in?
      @task.destroy
      set_type_task
      redirect_to request.referrer || root_path
      flash[:success] = "#{@type_task} apagad#{@sex} com sucesso!"
    else
      redirect_to new_user_session_path
    end
  end

  private

  def set_type_task
    if @task.typetask == 'Robô'
      @type_task = 'Robô'
      @sex = 'o'
    else
      @type_task = 'Tarefa'
      @sex = 'a'
    end
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def filter_tasks
    @tasks = current_user.tasks
  end

  def apply_filters
    @tasks = current_user.tasks
    case params[:filter]
    when 'today_tasks'
      @tasks = @tasks.today.today_ended.task
    when 'ended_tasks'
      @tasks = @tasks.ended.task
    when 'tasks'
      @tasks = @tasks.task
    when 'today_robots'
      @tasks = @tasks.today.today_ended.robot
    when 'ended_robots'
      @tasks = @tasks.ended.robot
    when 'robots'
      @tasks = @tasks.robot
    when 'aguardando', 'desenvolvendo', 'testando', 'concluido', 'rodando'
      @tasks = @tasks.send(params[:filter])
    end
  end

  def order_tasks
    if params[:filter_title].present?
      @tasks = @tasks.where('LOWER(title) LIKE ?', "%#{params[:filter_title].downcase}%")
    end
    @tasks = @tasks.where('start_date >= ?', params[:filter_start_date]) if params[:filter_start_date].present?
    @tasks = @tasks.where('end_date <= ?', params[:filter_end_date]) if params[:filter_end_date].present?
    @tasks = @tasks.where(priority: params[:filter_priority]) if params[:filter_priority].present?
    @tasks = @tasks.where(status: params[:filter_status]) if params[:filter_status].present?
    @tasks = @tasks.where(typetask: params[:filter_typetask]) if params[:filter_typetask].present?
    @tasks = @tasks.order(priority: :desc, finished: :desc)
  end

  def task_params
    params.require(:task).permit(:title, :description, :start_date, :end_date, :result, :priority, :status, :typetask,
                                 :finished, tag_ids: [])
  end
end
