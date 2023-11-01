class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :correct_user, only: [:destroy, :edit, :update]

  def index
    if params[:tab] == 'tab1'
      @posts = Post.order(views: :desc)
    elsif params[:tab] == 'tab2'
      @posts = current_user.liked_posts.order(created_at: :desc)
    else
      @posts = Post.order(created_at: :desc)
      @post = Post.new
      @comment = Comment.new
    end
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
    @post.increment!(:views)
    @comments = @post.comments
    return unless user_signed_in?
    @comment = Comment.new(post: @post)
  end

  def search
    @posts = Post.search(params[:keyword], params[:prefectures_id], params[:area_id])
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
    if @post = Post.find(params[:id])
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

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_path if @post.nil?
  end
end
