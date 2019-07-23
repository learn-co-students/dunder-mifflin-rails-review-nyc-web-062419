class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @emplyee.valid?
    @employee.update(employee_params)
    else
    flash[:message] = @employee.errors.full_messages[0]
    render :edit
    end
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
    if @employee.valid?
    @employee.save
    redirect_to @employee
    else
    flash[:message] = @employee.errors.full_messages[0]
    render :new
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy!
    redirect_to employees_path
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end
end
