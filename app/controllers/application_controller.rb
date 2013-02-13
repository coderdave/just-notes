class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  # before_filter :i_hate_web_dev

  # rescue_from Exception, with: :log_and_notify

  def access_denied
    render text: 'access_denied: requires a role' and return
  end

  def log_and_notify(exception)
    if Rails.env == "development"
      raise exception
    else
      # log to db
      ExceptionNotifier::Notifier.exception_notification(request.env, exception).deliver
    end
  end

  def i_hate_web_dev
    params.each do |key,value|
      # if it’s a hash, we need to check each value inside it…
      if value.is_a?(Hash)
        value.each do |hash_key,hash_value|
          params[key][hash_key] = ActionController::Base.helpers.sanitize hash_value
        end
        # params[key].symbolize_keys!
      elsif value.is_a?(String) || value.is_a?(Integer)
        params[key] = ActionController::Base.helpers.sanitize value
      end
    end
    # params.symbolize_keys!
  end

end
