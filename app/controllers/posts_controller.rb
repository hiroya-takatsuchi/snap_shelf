class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to '/'
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :explanation, :genre_id, :shelf_number_id).merge(user_id)
  end

end
