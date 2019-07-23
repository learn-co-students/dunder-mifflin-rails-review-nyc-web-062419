class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    flash.now[:messages] = []
    @employee = Employee.new()
    @dogs = Dog.all
  end

  def create
    @employee = Employee.new(strong_employee_params)
    @dogs = Dog.all
    if @employee.valid?
      @employee.save
      redirect_to employee_path(@employee)
    else
      flash.now[:messages] = []
      all_errors = @employee.errors.full_messages
      all_errors.each do |error|
        flash.now[:messages] << error 
      end
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    @dogs = Dog.all
    flash.now[:messages] = []
  end

  def update
    @employee = Employee.find(params[:id])
    @dogs = Dog.all
    if @employee.update(strong_employee_params)
      redirect_to employee_path(@employee)
    else
      flash.now[:messages] = []
      all_errors = @employee.errors.full_messages
      all_errors.each do |error|
        flash.now[:messages] << error 
      end
      render :edit
    end
  end

  private
  def strong_employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
  end
end
