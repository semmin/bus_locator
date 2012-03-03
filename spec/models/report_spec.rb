require 'spec_helper'

describe Report do

  describe "attributes" do
    it { should respond_to(:route_id) }
    it { should respond_to(:comment) }
    it { should respond_to(:lat) }
    it { should respond_to(:lon) }
  end
  
end