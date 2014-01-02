require "spec_helper"

describe CompletedCheckpointsController do
  describe "routing" do

    it "routes to #index" do
      get("/completed_checkpoints").should route_to("completed_checkpoints#index")
    end

    it "routes to #new" do
      get("/completed_checkpoints/new").should route_to("completed_checkpoints#new")
    end

    it "routes to #show" do
      get("/completed_checkpoints/1").should route_to("completed_checkpoints#show", :id => "1")
    end

    it "routes to #edit" do
      get("/completed_checkpoints/1/edit").should route_to("completed_checkpoints#edit", :id => "1")
    end

    it "routes to #create" do
      post("/completed_checkpoints").should route_to("completed_checkpoints#create")
    end

    it "routes to #update" do
      put("/completed_checkpoints/1").should route_to("completed_checkpoints#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/completed_checkpoints/1").should route_to("completed_checkpoints#destroy", :id => "1")
    end

  end
end
