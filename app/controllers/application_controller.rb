class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when User
      redirect_to root_path
    when Company
      redirect_to root_path
    end
  end
end
