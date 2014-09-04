class FlyingSwitchController < ActionController::Base

  def async
    fs = params[:fs]
    method = params[:method]
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
      model = path[0].singularize
      second = path[1]
      case second
      when /\d/
        # show path
        instance_variable_set("@#{model}", model.capitalize.constantize.find(second))
        render :partial => "#{model.pluralize}/#{model}", layout: false
      when 'new'
        # new path
        case method
        when 'GET'
          instance_variable_set("@#{model}", model.capitalize.constantize.new)
          render :partial => "#{model.pluralize}/new_#{model}", layout: false
        when 'POST'
          # Save item
        end
      end
    elsif path.length == 3
      # Edit/Delete/New/Create
      model = path[0].singularize
      id = path[1]
      action = path[2]
      case action
      when 'edit'

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
