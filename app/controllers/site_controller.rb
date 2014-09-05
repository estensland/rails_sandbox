class SiteController < ApplicationController

  def index
      binding.pry
  end

  protect_from_forgery with: :exception
end