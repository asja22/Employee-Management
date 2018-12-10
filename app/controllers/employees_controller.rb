class EmployeesController < ApplicationController
  before_action :authenticate_user!
  def home
  end
  
  def index
    @employee=Employee.all
  end

  def new
    @employee=current_user.employees.build
  end

  def show
    @employee=Employee.find(params[:id])
  end

  def edit
    @employee=Employee.find(params[:id])
  end
  
  def create
      @employee = current_user.employees.new(employee_params)   
      if @employee.save
        flash[:success] = "New Employee Created"
        redirect_to @employee
      else
        render 'new'
      end
  end
  
  def update
    @employee = Employee.find(params[:id])
      if @employee.update_attributes(employee_params)
        flash[:success] = "Profile updated"
              redirect_to @employee
      else
        render 'edit'
      end
  end
  
  def employee_params
        params.require(:employee).permit(:empid, :name, :doj, :email, :department_id,
                                     :position_id)
  end
  
  def destroy
      Employee.find(params[:id]).destroy
      flash[:success] = "Employee deleted"
      redirect_to employees_path
  end
  
  def search
    if params[:department].blank? && params[:search].blank?  
       redirect_to(employees_path, alert: "Empty field!") and return  
     else
        @employee_name = params[:search].downcase 
        @employee_department = params[:department].downcase 
        
        @results = Employee.all.where("lower(name) LIKE ? AND lower(department_id) LIKE ?" ,"%#{@employee_name}%","%#{@employee_department}%") 
          
     end 
  end
  
end
