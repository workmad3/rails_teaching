require 'spec_helper'

describe TicketsController, "creating a ticket" do
  
  before(:each) do
    Ticket.stub!(:new).and_return(@ticket = mock_model(Ticket))
  end

  it "should create a ticket object" do
    Ticket.should_receive(:new)
    #perform request for 'new' action on TicketsController
    #equivalent to doing /tickets/new in a browser
    get :new
  end

  it "should create a db entry" do
    Ticket.should_receive(:new).with({"subject" => "Awesome"})
    @ticket.should_receive(:save)
    post :create, :ticket => {"subject" => "Awesome"}
  end
end
