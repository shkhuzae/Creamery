# require needed files

require './test/sets/store_contexts'
require './test/sets/employee_contexts'
require './test/sets/assignment_contexts'
require './test/sets/shift_contexts'
require './test/sets/job_contexts'
require './test/sets/flavor_contexts'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::StoreContexts
  include Contexts::EmployeeContexts
  include Contexts::AssignmentContexts
  include Contexts::ShiftContexts
  include Contexts::JobContexts
  include Contexts::FlavorContexts
  
 def create_contexts
    create_employees
    create_stores
    create_assignments
    create_shifts
    create_jobs
    create_flavors
 end
  
  def destroy_contexts
    destroy_employees
    destroy_stores
    destroy_assignments
    destroy_shifts
    destroy_jobs
    destroy_flavors
  end
  

end