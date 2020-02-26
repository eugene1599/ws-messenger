class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to main_app.root_url }
      format.js { render 'shared/access_denied' }
    end
  end

  before_action :authenticate_user!, unless: :devise_controller?
end
