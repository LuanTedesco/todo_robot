class TagsController < ApplicationController
  layout 'application_tasks'
  before_action :set_tag, only: %i[show edit update destroy]

  def index
    if user_signed_in?
      @tags = current_user.tags
    else
      redirect_to new_user_session_path
    end
  end

  def show; end

  def new
    if user_signed_in?
      @tag = Tag.new
    else
      redirect_to new_user_session_path
    end
  end

  def edit; end

  def create
    if user_signed_in?
      @tag = current_user.tags.build(tag_params)
      if @tag.save
        redirect_to tags_path
        flash[:success] = 'Tag criada com sucesso'
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_path
    end
  end

  def update
    if user_signed_in?
      if @tag.update(tag_params)
        redirect_to tags_path
        flash[:success] = 'Tag alterada com sucesso!'
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    if user_signed_in?
      @tag.destroy
      redirect_to tags_path
      flash[:success] = 'Tag apagada com sucesso!'
    else
      redirect_to new_user_session_path
    end
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
