require "rails_helper"

RSpec.describe PrioritiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/priorities").to route_to("priorities#index")
    end

    it "routes to #new" do
      expect(get: "/priorities/new").to route_to("priorities#new")
    end

    it "routes to #show" do
      expect(get: "/priorities/1").to route_to("priorities#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/priorities/1/edit").to route_to("priorities#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/priorities").to route_to("priorities#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/priorities/1").to route_to("priorities#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/priorities/1").to route_to("priorities#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/priorities/1").to route_to("priorities#destroy", id: "1")
    end
  end
end
