require "spec_helper"

describe InstructionalCoachesController do
  describe "routing" do

    it "routes to #index" do
      get("/instructional_coaches").should route_to("instructional_coaches#index")
    end

    it "routes to #new" do
      get("/instructional_coaches/new").should route_to("instructional_coaches#new")
    end

    it "routes to #show" do
      get("/instructional_coaches/1").should route_to("instructional_coaches#show", :id => "1")
    end

    it "routes to #edit" do
      get("/instructional_coaches/1/edit").should route_to("instructional_coaches#edit", :id => "1")
    end

    it "routes to #create" do
      post("/instructional_coaches").should route_to("instructional_coaches#create")
    end

    it "routes to #update" do
      put("/instructional_coaches/1").should route_to("instructional_coaches#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/instructional_coaches/1").should route_to("instructional_coaches#destroy", :id => "1")
    end

  end
end
