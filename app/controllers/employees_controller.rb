class EmployeesController < ApplicationController
    
    def index
        @employees = Employee.all
    end
    
    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        @dogs = Dog.all
        @employee = Employee.new employee_params
        if @employee.valid?
            if @employee.img_url == ""
                @employee.img_url = "https://www.cmcaindia.org/wp-content/uploads/2015/11/default-profile-picture-gmail-2.png"
            end    
            @employee.save
            flash[:message] = "Welcome #{@employee.full_name}"
            redirect_to @employee
        else
            flash.now[:message] = @employee.errors.full_messages
            render :new
        end
    end

    def edit
        @employee = Employee.find(params[:employee][:id])
        @dogs = Dog.all
    end

    def update
        employee = Employee.find(params[:id])
        employee.update employee_params
        redirect_to employee
    end

    private 

    def employee_params
        params.require(:employee).permit(:first_name, :last_name,:alias,:title,:office,:dog_id,:img_url)
    end
end
