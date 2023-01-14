class PostsController < ApplicationController
  before_action :find_post, only: %i[edit show update destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post has been successfully created'
      redirect_to posts_path
    else
      flash[:notice] = @post.errors.full_messages.join(' ')
      redirect_to new_post_path
    end
  end

  def show; end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :published_at, :author_id, category_ids: [])
  end
end
