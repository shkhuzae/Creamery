module DemosHelper
    def login(user)
        puts user.id
        session[:user_id] = user.id
        puts session[:user_id]
    end
    
    def current_user
        puts session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
        session[:current_user] = @current_user
        
    end
    
    def role
        @current_user = Employee.find_by(id: current_user.employee_id)
        return @current_user.role
    end
    
    def logged_in?
       !current_user.nil?
    end
    
    def logout
        session.delete(:user_id)
        @current_user = nil
    end
end
