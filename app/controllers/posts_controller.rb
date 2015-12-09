class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = 'Your post has been created.'
      redirect_to @post
    else
      flash[:alert] = 'You need an image to post here!'
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = 'Post updated.'
      redirect_to @post
    else
      flash[:alert] = 'Update failed.'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if Post.delete(@post)
      flash[:success] = 'Post deleted.'
      redirect_to root_path
    else
      flash[:alert] = 'Delete post failed.'
      render :show
    end
  end

  private
  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
