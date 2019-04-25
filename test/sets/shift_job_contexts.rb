module Contexts
    module ShiftJobContexts
        
        def create_shift_jobs
            @sj1 = FactoryBot.create(:shift_job, shift: @ed_shift1, job: @cleaning)
            @sj2 = FactoryBot.create(:shift_job, shift: @ed_shift2, job: @washing)
            @sj3 = FactoryBot.create(:shift_job, shift: @ed_shift3, job: @mopping)
        end
        
        def remove_shift_jobs
            @sj1.destroy
            @sj2.destroy
            @sj3.destroy
        end
    end
    
end