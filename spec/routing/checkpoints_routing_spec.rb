require "spec_helper"

describe CheckpointsController do
  describe "routing" do

    it "routes to #index" do
      get("/checkpoints").should route_to("checkpoints#index")
    end

    it "routes to #new" do
      get("/checkpoints/new").should route_to("checkpoints#new")
    end

    it "routes to #show" do
      get("/checkpoints/1").should route_to("checkpoints#show", :id => "1")
    end

    it "routes to #edit" do
      get("/checkpoints/1/edit").should route_to("checkpoints#edit", :id => "1")
    end

    it "routes to #create" do
      post("/checkpoints").should route_to("checkpoints#create")
    end

    it "routes to #update" do
      put("/checkpoints/1").should route_to("checkpoints#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/checkpoints/1").should route_to("checkpoints#destroy", :id => "1")
    end

  end
end
