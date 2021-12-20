class GoodsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    Good.create(user_id: current_user.id, post_id: params[:id])
  end
  
  def destroy
    Good.find_by(user_id: current_user.id, post_id: params[:id]).destroy
  end
  
  private
  
  def set_post
    @post = Post.find(params[:id])
  end

end
