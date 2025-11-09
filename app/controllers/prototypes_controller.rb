class PrototypesController < ApplicationController
  # ログインしていないユーザーは「index」「show」以外アクセスできない
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.build(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # 投稿者以外は編集ページにアクセスできない
    redirect_to root_path unless @prototype.user == current_user
  end

  def update
    if @prototype.user == current_user
      if @prototype.update(prototype_params)
        redirect_to prototype_path(@prototype)
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if @prototype.user == current_user
      @prototype.destroy
      redirect_to root_path, notice: "プロトタイプを削除しました。"
    else
      redirect_to root_path
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:name, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end