class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    if request.xhr?
      render partial: 'comments', layout: false
    end
  end

  def show
    @comment = Comment.find(params[:id])
    if request.xhr?
      render partial: 'comment', layout: false
    end
  end

  protect_from_forgery with: :exception
end