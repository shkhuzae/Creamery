module Contexts
    module UserContexts
        
    def create_users
      @ed_user = FactoryBot.create(:user, employee: @ed, email: "ed@example.com", password: "12345")
      @cindy_user = FactoryBot.create(:user, employee: @cindy, email: "cindy@example.com", password: "12345")
      @ben_user = FactoryBot.create(:user, employee: @ben, email: "ben@example.com", password: "12345")
      @alex_user = FactoryBot.create(:user, employee: @alex, email: "alex@example.com", password: "12345")
    end
    
    def remove_users
      @ed_user.destroy
      @cindy_user.destroy
      @ben_user.destroy
      @alex_user.destroy
    end
        
        
    end
    
end