class AnimalsController < ApplicationController
  def index
    @animal = Animal.all
  end
  
  def show
    animal_id = params[:id]
    @animal = Animal.find_by(id: animal_id)
    if @animal.nil?
      redirect_to root_path
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
    animal_id = params[:id]
    @animal = Animal.find_by(id: animal_id)
    
    if @animal == nil?
      redirect_to root_path
    end
  end
  
  def update
    animal_id = params[:id]
    @animal = Animal.find(animal_id)
    @animal.update(name: params[:animal][:name], species: params[:animal][:species], age: params[:animal][:age], sex: params[:animal][:sex], notes: params[:animal][:notes] )
    
    if @animal.save
      redirect_to root_path
      return
    else
      render :edit
      return
    end
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