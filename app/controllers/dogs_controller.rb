class DogsController < ApplicationController
  def index
    @dogs = Dog.all 
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create 
    @dog = Dog.new(dog_params)
    if @dog.valid? 
      @dog.save 
    else 
      flash.now[:message] = @dog.errors.full_messages[0]
  end
end 


end
