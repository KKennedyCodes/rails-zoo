ANIMALS = [
{name: "Bobo", species: "Monkey", age: 4, sex: "M", notes: "Likes Ice Cream", img: "http://lorempixel.com/200/200/animals/"}
]

class ApplicationController < ActionController::Base
  def index
    @animals = ANIMALS
  end
  
  def show
  end
  
  def edit
  end
  
  def find
  end
  
  def destroy
  end
end
