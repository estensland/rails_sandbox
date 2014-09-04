class FlyingSwitchController < ActionController::Base

  def async
    fs = params[:fs]
    args = {}

    if fs.include?('?')
      fs = fs.split('?', 2)
      path = fs[0]
      args = fs[1].split('&')
      args = Hash[args.map{|param| [param.split('=').first, param.split('=').last ]}]
    else
      path = fs
    end
    if path.include?('/')
      fs = fs.split('/')
      model = fs.first.singularize
      id = fs[1]
    else
      model = path
    end

    if id.present?
      # Show route
      instance_variable_set("@#{model}", model.capitalize.constantize.find(id))
      render :partial => "#{model.pluralize}/#{model}", layout: false
    else
      # Index route
      limit  = args['limit']
      offset = args['offset']

      instance_variable_set("@#{model}", model.singularize.capitalize.constantize.limit(limit).offset(offset))
      render :partial => "#{model}/#{model}", layout: false
    end
  end

  protect_from_forgery with: :exception
end
