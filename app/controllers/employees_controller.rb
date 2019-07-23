class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end
    def show
        @employee = Employee.find(params[:id])
    end
    def new
        @dogs = Dog.all 
        @employee = Employee.new
    end
    def create
        @employee = Employee.new(employee_params)
        @dogs = Dog.all
        if @employee.valid?
            @employee.save
        else
            flash.now[:message] = @employee.errors.full_messages[0]
            render :new
        end        
    end
    def edit
        @dogs = Dog.all 
        @employee = Employee.find(params[:id])
    end
    def update
       @dogs = Dog.all 
       @employee = Employee.find(params[:id]) 
       if @employee.update(employee_params)
            redirect_to employees_path
       else
            flash.now[:message] = @employee.errors.full_messages.first
            render :edit
       end
    end
    private
    def employee_params
        params.require(:employee).permit(:first_name,:last_name,:alias,:title,:office,:img_url,:dog_id)
    end
end

# 
