class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Catch all CanCan error and alert the user of the exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, flash: { notice: "Please go away, I don't like you. #{exception.message}" }
  end

  private
  def not_authenticated
    redirect_to login_url, flash: { alert: "First login to access this page" }
  end
end
