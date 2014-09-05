class TagsController < ApplicationController

  def index
    @tags = Tag.all
    if request.xhr?
      render partial: 'tags', layout: false
    end
  end

  def show
    @tag = Tag.find(params[:id])
    if request.xhr?
      render partial: 'tag', layout: false
    end
  end

  protect_from_forgery with: :exception
end