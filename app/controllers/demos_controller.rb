class DemosController < ApplicationController
    
    def home
    
    end
    
    
    def create
        user = User.find_by(email: params[:demo][:email].downcase) 
       if user && user.authenticate(params[:demo][:password])
           login(user)
        if logged_in? and current_user.role?(:employee)
            redirect_to regulars_employees_path
        elsif logged_in? and current_user.role?(:admin)
            redirect_to admins_employees_path
        elsif logged_in? and current_user.role?(:manager)
            redirect_to managers_employees_path
        else
            redirect_to home_path
        end
       else
           flash.now[:danger] = "Invalid email or password"
           render 'new'
       end
    end
    
    def destroy
        logout
        redirect_to logout_path
    end
end
