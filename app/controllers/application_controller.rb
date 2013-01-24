class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  # rescue_from Exception, with: :log_and_notify

  def log_and_notify(exception)
    if Rails.env == "development"
      raise exception
    else
      # log to db
      ExceptionNotifier::Notifier.exception_notification(request.env, exception).deliver
    end

  end

end
