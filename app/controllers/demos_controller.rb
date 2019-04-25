class DemosController < ApplicationController
    
    def home
    
    end
    
    def employeedash
        
    end
    
    def managerdash
        
    end
    
    def admindash
        
    end
    
    def create
        puts params[:demo][:email]
        puts params[:demo][:password]
        user = User.find_by(email: params[:demo][:email].downcase) 
       if user && user.authenticate(params[:demo][:password])
           login(user)
        if logged_in? and current_user.role?(:employee)
            redirect_to employeedash_path
        elsif logged_in? and current_user.role?(:admin)
            redirect_to admindash_path
        elsif logged_in? and current_user.role?(:manager)
            redirect_to managerdash_path
        else
            redirect_to home_path
        end
       else
           flash.now[:danger] = "Invalid email or password"
           render 'home'
       end
    end
    
    def destroy
        logout
        redirect_to login_path
    end
end
