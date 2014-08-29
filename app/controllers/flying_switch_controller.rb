class FlyingSwitchController < ActionController::Base

  def async
    model = params[:model]
    id = params[:id]
    if id.present?
      instance_variable_set("@#{model}", model.capitalize.constantize.find(id))
    else
      instance_variable_set("@#{model}", model.capitalize.constantize.all)
    end
    render :partial => "#{model}", layout: false
  end

  protect_from_forgery with: :exception
end
