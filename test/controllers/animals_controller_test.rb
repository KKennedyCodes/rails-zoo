require "test_helper"

describe AnimalsController do
  
  it "should get index" do
    get "/animals"
    must_respond_with :success
  end
  
end
