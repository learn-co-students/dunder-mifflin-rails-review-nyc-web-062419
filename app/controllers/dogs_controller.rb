class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def new
  end

  def edit
  end

  def show
    @dog = Dog.find(params[:id])
    @employees = Employee.all.select do |employee|
      employee.dog_id == @dog.id
    end
  end
end
 