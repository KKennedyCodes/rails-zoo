# require "test_helper"

# describe AnimalsController do

#   it "should get index" do
#     get "/animals"
#     must_respond_with :success
#   end

# end

require "test_helper"

describe AnimalsController do
  let (:animal) {
    Animal.create(name: "sample animal", species: "sample species", age: 5, sex: "Unknown", notes: "sample notes")
  }
  
  # Tests for Wave 1
  describe "index" do
    it "can get the index path" do
      # Act
      get animals_path
      
      # Assert
      must_respond_with :success
    end
    
    it "can get the root path" do
      # Act
      get root_path
      
      # Assert
      must_respond_with :success
    end
  end
  
  # Unskip these tests for Wave 2
  describe "show" do
    it "can get a valid animal" do
      #skip
      # Act
      get animal_path(animal.id)
      
      # Assert
      must_respond_with :success
    end
    
    it "will redirect for an invalid animal" do
      #skip
      # Act
      get animal_path(-1)
      
      # Assert
      must_respond_with :redirect
      # expect(flash[:error]).must_equal "Could not find animal with id: -1"
    end
  end
  
  describe "new" do
    it "can get the new animal page" do
      #skip
      
      # Act
      get new_animal_path
      
      # Assert
      must_respond_with :success
    end
  end
  
  describe "create" do
    it "can create a new animal" do
      #skip
      
      # Arrange
      animal_hash = {
        animal: {
          name: "sample animal", 
          species: "sample species", 
          age: 5, 
          sex: "Unknown", 
          notes: "sample notes"
        },
      }
      
      
      # Act-Assert
      expect {
        post animals_path, params: animal_hash
      }.must_change "Animal.count", 1
      
      new_animal = Animal.find_by(name: animal_hash[:animal][:name])
      expect(new_animal.species).must_equal animal_hash[:animal][:species]
      expect(new_animal.sex).must_equal animal_hash[:animal][:sex]
      expect(new_animal.age).must_equal animal_hash[:animal][:age]
      expect(new_animal.notes).must_equal animal_hash[:animal][:notes]
      
      
      must_respond_with :redirect
      #must_redirect_to animal_path(new_animal.id)
    end
  end
  
  # Unskip and complete these tests for Wave 3
  describe "edit" do
    it "can get the edit page for an existing animal" do
      #skip
      # Act
      get edit_animal_path(animal.id)
      
      # Assertr
      must_respond_with :success
    end
    
    it "will respond with redirect when attempting to edit a nonexistant animal" do
      #skip
      # Your code here
      # Act
      get edit_animal_path(-1)
      
      # Assert
      must_respond_with :redirect
    end
  end
  
  # Uncomment and complete these tests for Wave 3
  describe "update" do
    #   let (:animal) {
    #     Animal.create(name: "sample animal", species: "sample species", age: 5, sex: "Unknown", notes: "sample notes")
    #   }
    #   get animal_path(animal.id)
    # Note:  If there was a way to fail to save the changes to a animal, that would be a great
    #        thing to test.
    it "can update an existing animal" do
      # Your code here
    end
    
    it "will redirect to the root page if given an invalid id" do
      # Act
      get edit_animal_path(-1)
      
      # Assert
      must_respond_with :redirect
    end
  end
  
  # # Complete these tests for Wave 4
  # describe "destroy" do
  #   # Your tests go here
  
  # end
  
  # # Complete for Wave 4
  # describe "toggle_complete" do
  #   # Your tests go here
  # end
end
