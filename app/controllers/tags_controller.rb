class TagsController < ApplicationController
  layout 'application_tasks'
  before_action :authenticate_user!
  before_action :set_tag, only: %i[show edit update destroy]

  def index
      @tags = current_user.tags
  end

  def show; end

  def new
      @tag = Tag.new
  end

  def edit; end

  def create
      @tag = current_user.tags.build(tag_params)
      if @tag.save
        redirect_to tags_path
        flash[:success] = 'Tag criada com sucesso'
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
      if @tag.update(tag_params)
        redirect_to tags_path
        flash[:success] = 'Tag alterada com sucesso!'
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
      @tag.destroy
      redirect_to tags_path
      flash[:success] = 'Tag apagada com sucesso!'
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
