require 'spec_helper'

describe ReportsController do

  describe "routing" do
    it "recognizes and properly generates a route to create a report" do 
        { post: "/reports" }.should route_to("reports#create")
    end
  end
  
end