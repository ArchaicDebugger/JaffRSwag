require "rails_helper"

RSpec.describe DevelopersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/developers").to route_to("developers#index")
    end

    it "routes to #show" do
      expect(get: "/developers/1").to route_to("developers#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/developers").to route_to("developers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/developers/1").to route_to("developers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/developers/1").to route_to("developers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/developers/1").to route_to("developers#destroy", id: "1")
    end
  end
end
