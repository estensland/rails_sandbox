class FlyingSwitchController < ActionController::Base

  def async

    fs = params[:fs].split('/')
    if fs.length == 1
      model = fs.first.singularize
    else 
      model = fs.first.singularize
      id = fs.last
    end

    if id.present?
      instance_variable_set("@#{model}", model.capitalize.constantize.find(id))
      render :partial => "#{model.pluralize}/#{model}", layout: false
    else
      instance_variable_set("@#{model.pluralize}", model.capitalize.constantize.all)
      render :partial => "#{model.pluralize}/#{model.pluralize}", layout: false
    end
  end

  protect_from_forgery with: :exception
end
