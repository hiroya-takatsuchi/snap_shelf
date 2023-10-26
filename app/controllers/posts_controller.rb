class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if@post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :explanation, :genre_id, :shelf_number_id).merge(user_id: current_user.id)
  end

end
