class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    # @blog = Blog.new(blog_params)
    # @blog.user_id = current_user.id
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: '作成しました'
      else
        render :new
      end
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: '編集しました'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: '削除しました'
  end

  def confirm
    # @blog = Blog.new(blog_params)
    # @blog.user_id = current_user.id
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
