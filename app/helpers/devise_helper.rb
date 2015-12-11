module DeviseHelper

  def devise_error_messages!
    errors = []
    flash.each do |name, msg|
      if name == 'alert'
        errors << msg
      end
    end
    errors += resource.errors.full_messages
    errors = errors.uniq
    return "" if errors.empty?
    errors
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end
