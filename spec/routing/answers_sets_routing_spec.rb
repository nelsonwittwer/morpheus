require "spec_helper"

describe AnswersSetsController do
  describe "routing" do

    it "routes to #index" do
      get("/answers_sets").should route_to("answers_sets#index")
    end

    it "routes to #new" do
      get("/answers_sets/new").should route_to("answers_sets#new")
    end

    it "routes to #show" do
      get("/answers_sets/1").should route_to("answers_sets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/answers_sets/1/edit").should route_to("answers_sets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/answers_sets").should route_to("answers_sets#create")
    end

    it "routes to #update" do
      put("/answers_sets/1").should route_to("answers_sets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/answers_sets/1").should route_to("answers_sets#destroy", :id => "1")
    end

  end
end
