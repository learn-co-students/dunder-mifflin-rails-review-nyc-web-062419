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
    @employee = Employee.new(employee_params)
    if @employee.valid?
      @employee.save
      redirect_to employee_path(@employee)
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
      @employee.update(employee_params)  
       if @employee.valid?
      redirect_to employee_path(@employee)
    else 
      flash.now[:message] = @employee.errors.full_messages[0]
      render :edit
  end
end 

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end 
end
