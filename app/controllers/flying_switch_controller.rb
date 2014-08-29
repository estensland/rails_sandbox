class FlyingSwitchController < ActionController::Base

  def async
    model = params[:model]
    id = params[:id]

    instance_variable_set("@#{model}", model.capitalize.constantize.find(id))
    render :partial => "#{model.pluralize}/#{model}_view", layout: false
  end

  protect_from_forgery with: :exception
end
