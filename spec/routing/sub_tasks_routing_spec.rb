require "rails_helper"

RSpec.describe SubTasksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/sub_tasks").to route_to("sub_tasks#index")
    end

    it "routes to #new" do
      expect(get: "/sub_tasks/new").to route_to("sub_tasks#new")
    end

    it "routes to #show" do
      expect(get: "/sub_tasks/1").to route_to("sub_tasks#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/sub_tasks/1/edit").to route_to("sub_tasks#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/sub_tasks").to route_to("sub_tasks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/sub_tasks/1").to route_to("sub_tasks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/sub_tasks/1").to route_to("sub_tasks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/sub_tasks/1").to route_to("sub_tasks#destroy", id: "1")
    end
  end
end
