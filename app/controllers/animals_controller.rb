ANIMALS = [
{name: "Bobo", species: "Monkey", age: 4, sex: "M", notes: "Likes Ice Cream", img: "http://lorempixel.com/200/200/animals/"}
]

class AnimalsController < ApplicationController
  def index
    @animals = ANIMALS
  end
  
  def show
    animal_id = params[:id].to_i
    @animal = ANIMALS[animal_id]
    if @animal.nil?
      head :not_found
      return
    end
  end
  
  def edit
  end
  
  def find
  end
  
  def destroy
  end
end
