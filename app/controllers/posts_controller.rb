class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_post, only: [:destroy, :edit, :update, :show]

  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if current_user.id == @post.user_id
      @post.destroy
    else
      redirect_to root_path
    end
    redirect_to root_path
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @comments = @post.comments.includes(:user)
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:text, :image).merge(user_id: current_user.id)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end

end
