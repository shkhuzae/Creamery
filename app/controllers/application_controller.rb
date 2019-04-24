class ApplicationController < ActionController::Base
    include DemosHelper
    rescue_from CanCan::AccessDenied do |exception|
        flash[:warning] = exception.message
        redirect_to home_path
    end
end
