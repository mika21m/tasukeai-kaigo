class PostsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @posts = Post.all
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
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      @post.destroy
    else
      redirect_to root_path
    end
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:text, :image).merge(user_id: current_user.id)
  end
  
end
