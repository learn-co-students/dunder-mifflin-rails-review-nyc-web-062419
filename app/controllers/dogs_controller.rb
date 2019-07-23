class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def sorted_by_employees
    @dogs = Dog.all.sort_by { |dog| dog.employees.length }
    @dogs = @dogs.reverse
    render :index
  end
end
