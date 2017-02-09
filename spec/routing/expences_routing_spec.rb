require "rails_helper"

RSpec.describe ExpencesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/expences").to route_to("expences#index")
    end

    it "routes to #new" do
      expect(:get => "/expences/new").to route_to("expences#new")
    end

    it "routes to #show" do
      expect(:get => "/expences/1").to route_to("expences#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/expences/1/edit").to route_to("expences#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/expences").to route_to("expences#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/expences/1").to route_to("expences#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/expences/1").to route_to("expences#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/expences/1").to route_to("expences#destroy", :id => "1")
    end

  end
end
