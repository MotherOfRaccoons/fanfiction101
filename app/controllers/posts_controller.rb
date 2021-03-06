class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    sort_param = if ['title', 'synopsis', 'created_at asc', 'created_at desc'].include?(params[:sort])
                   params[:sort]
                 else
                   'title'
                 end

    @posts = Post.order(sort_param).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :synopsis)
  end
end
