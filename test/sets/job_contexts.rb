module Contexts
    module JobContexts
        def create_jobs
            @cleaning = FactoryBot.create(:job, name: "Cleaning", description: "Employees must clean the floor", active: true)
            @washing = FactoryBot.create(:job, name: "Washing", description: "Employees must wash the dishes", active: true)
            @mopping = FactoryBot.create(:job, name: "Mopping", description: "Employees must mop the floor", active: true)
            @cashier = FactoryBot.create(:job, name: "Cashier", description: "Employees must be in the counter", active: false)
        end
        
        def remove_jobs
            @cleaning.destroy
            @washing.destroy
            @mopping.destroy
            @cashier.destroy
        end
    end
end