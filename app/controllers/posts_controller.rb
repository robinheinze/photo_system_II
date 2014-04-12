class PostsController < ApplicationController

  before_filter :authorize_posts, only: [:new, :edit, :update, :destroy, :create]

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_path(@post.user)
    else
      @user = User.find(params[:user_id])
      render "new"
    end
  end

  def index
    @user = User.find(params[:user_id])
  end


  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@post.user)
  end

  def edit
    @post = Post.find(params[:id])
    @user = @post.user
    @tag = Tag.new
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "The post '#{@post.title}' was successfully updated!"
      redirect_to user_path(@post.user)
    else
      render 'edit'
    end
  end

private
  def post_params
    params.require(:post).permit(:user_id, :content, :title, :photo)
  end
end
