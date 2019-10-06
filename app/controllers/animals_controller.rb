class AnimalsController < ApplicationController
  def index
    @animal = Animal.all
  end
  
  def show
    animal_id = params[:id]
    @animal = Animal.find_by[:id]
    if @animal.nil?
      head :not_found
      return
    end
  end
  
  def new
    @animal = Animal.new
  end
  
  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to root_path
    else
      render :new
      return
    end
  end
  
  def edit
  end
  
  def destroy
    animal_id = params[:id]
    @animal = Animal.find_by(id: animal_id)
    @animal.delete
    redirect_to root_path
  end
end

private

def animal_params
  return params.require(:animal).permit(:name, :species, :age, :sex, :notes)
end

