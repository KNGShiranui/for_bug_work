class CommentsController < ApplicationController
  before_action :set_blog, only: [:create, :destroy]

  def create
    @comment = @blog.comments.create(comment_params)
    redirect_to blog_path(@blog)
  end

  def destroy
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    # binding.pry
    redirect_to blog_path(params[:blog_id])
    # redirect_to blog_path(@blog)でもOK
    # redirect_to blog_pathとすると、明示的ではないが
    # redirect_to blog_path(params[:id])とrailsに認識される
    # params[:id]はblogに関連付けられたcommentのidなので
    # コメント削除前のblog投稿先に正しく戻れなくなる。
    # よって、redirect_to blog_path(params[:blog_id])
    # と記述して明示的にblogのidを取得しに行かなければならない。
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :content, :blog_id)
  end
end