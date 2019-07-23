class DogsController < ApplicationController

    def index
        @dogs_hash = Dog.all.group_by{|dog| dog.employees.length}
        @ordered_keys = @dogs_hash.keys.sort.reverse
    end

    def show
        @dog = Dog.find(params[:id])
    end

end
 