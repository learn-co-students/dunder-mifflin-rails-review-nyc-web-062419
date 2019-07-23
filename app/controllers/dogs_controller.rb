class DogsController < ApplicationController
    def index
        @dogs = Dog.all
    end
    
    def show
        @dog = Dog.find(params[:id])
    end

    def sort
        @sort = true
        @dogs = Dog.all
        render :index
    end
    
end
