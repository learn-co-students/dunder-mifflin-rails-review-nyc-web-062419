class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end
    
    def new
        @employee = Employee.new
        @dogs = Dog.all
    end
    
    def create
        @employee = Employee.new(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to @employee
        else
            flash.now[:message] = @employee.errors.full_messages[0]
            @dogs = Dog.all
            render :new
        end
    end
    
    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end
    
    def update
        @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
            redirect_to @employee
        else
            flash.now[:message] = @employee.errors.full_messages[0]
            @dogs = Dog.all
            render :edit
        end
        
    end
    
    def show
        @employee = Employee.find(params[:id])
    end
    
    private
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end
end
