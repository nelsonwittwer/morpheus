require "spec_helper"

describe HasAnswersSetsController do
  describe "routing" do

    it "routes to #index" do
      get("/has_answers_sets").should route_to("has_answers_sets#index")
    end

    it "routes to #new" do
      get("/has_answers_sets/new").should route_to("has_answers_sets#new")
    end

    it "routes to #show" do
      get("/has_answers_sets/1").should route_to("has_answers_sets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/has_answers_sets/1/edit").should route_to("has_answers_sets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/has_answers_sets").should route_to("has_answers_sets#create")
    end

    it "routes to #update" do
      put("/has_answers_sets/1").should route_to("has_answers_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/has_answers_sets/1").should route_to("has_answers_sets#destroy", :id => "1")
    end

  end
end
