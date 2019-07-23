class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
    @employee = Employee.all.select do |employee|
      employee.dog_id == @dog.id 
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.valid?
    @dog.update(dog_params)
    redirect_to @dog
    else
    flash[:message] = @dog.errors.full_messages[0]
    render :edit
    end
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.create(dog_params)
    if @dog.valid?
    @dog.save
    redirect_to @dog
    else
    flash[:message] = @dog.errors.full_messages[0]
    render :new
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy!
    redirect_to dogs_path
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age)
  end
end
