class FlyingSwitchController < ActionController::Base

  def async
    fs = params[:fs]
    args = {}

    if fs.include?('?')
      fs = fs.split('?', 2)
      path = fs[0]
      args = fs[1].split('&')
      args = Hash[args.map{|param| [param.split('=')[0], param.split('=').last ]}]
    else
      path = fs.split('/')
    end
    if path.length == 2
      # show path
      model = path[0].singularize
      id = path[1]
      instance_variable_set("@#{model}", model.capitalize.constantize.find(id))
      render :partial => "#{model.pluralize}/#{model}", layout: false
    elsif path.length == 3
      # Edit/Delete/New/Create
      model = path[0].singularize
      id = path[1]
      action = path[2]
      case action
      when 'edit'

      when 'new'

      end
    else
      model = path[0]
      limit  = args['limit']
      offset = args['offset']
      instance_variable_set("@#{model}", model.singularize.capitalize.constantize.limit(limit).offset(offset))
      render :partial => "#{model}/#{model}", layout: false
    end
  end

  protect_from_forgery with: :exception
end
