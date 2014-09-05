class PostsController < ApplicationController

  def index
      binding.pry
    @posts = Post.all
    if request.xhr?
      render partial: 'posts', layout: false
    end
  end

  def show
    @post = Post.find(params[:id])
    if request.xhr?
      render partial: 'post', layout: false
    end
  end

  protect_from_forgery with: :exception
end