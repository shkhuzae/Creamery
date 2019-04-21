module Contexts
    module FlavorContexts
     
        def create_flavors
            @vanilla = FactoryBot.create(:flavor, name: "Vanilla", active: true)
            @chocolate = FactoryBot.create(:flavor, name: "Chocolate", active: false)
            @strawberry = FactoryBot.create(:flavor, name: "Strawberry", active: true)
            @mint = FactoryBot.create(:flavor, name: "Mint", active: false)
            @jamoca = FactoryBot.create(:flavor, name: "Jamoca", active: true)
        end
        
        def remove_flavors
            @vanilla.destroy
            @chocolate.destroy
            @strawberry.destroy
            @mint.destroy
            @jamoca.destroy
        end
    end  
end