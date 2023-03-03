class CommentsController < ApplicationController
  before_action :set_blog, only: [:create, :destroy]

  def create
    @comment = @blog.comments.create(comment_params)
    redirect_to blog_path(@blog)
  end

  def destroy
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    redirect_to blog_path(params[:blog_id])
    # redirect_to blog_path(@blog)でもOK

  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
    # binding.pry
  end

  def comment_params
    params.require(:comment).permit(:name, :content, :blog_id)
  end
end