class DogsController < ApplicationController

    def index 
        @dogs = Dog.all
    end

    
    def show
        @dog = Dog.find(params[:id])
        @owners = @dog.employees
    end

    def create
        @dogs = Dog.joins(:employees).order(name: :desc).uniq
        render :index
    end
    

end
