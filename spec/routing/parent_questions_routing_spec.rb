require "spec_helper"

describe ParentQuestionsController do
  describe "routing" do

    it "routes to #index" do
      get("/parent_questions").should route_to("parent_questions#index")
    end

    it "routes to #new" do
      get("/parent_questions/new").should route_to("parent_questions#new")
    end

    it "routes to #show" do
      get("/parent_questions/1").should route_to("parent_questions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/parent_questions/1/edit").should route_to("parent_questions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/parent_questions").should route_to("parent_questions#create")
    end

    it "routes to #update" do
      put("/parent_questions/1").should route_to("parent_questions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/parent_questions/1").should route_to("parent_questions#destroy", :id => "1")
    end

  end
end
