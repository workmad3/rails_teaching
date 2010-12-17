require 'spec_helper'

describe TicketsController, "creating a ticket" do
  
  before(:each) do
    Ticket.stub!(:new).and_return(@ticket = mock_model(Ticket, :save => true))
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

  it "should redirect to the show action" do
    post :create, :ticket => {"subject" => "Awesome"}
    response.should redirect_to(ticket_path(@ticket))
  end

  context "Showing a ticket" do
    before(:each) do
      Ticket.stub!(:find).and_return(@ticket = mock_model(Ticket, :subject => "test"))
    end

    it "should find the ticket" do
      Ticket.should_receive(:find).with(@ticket.id)
      get :show, :id => @ticket.id
    end

    it "should store the ticket for the view" do
      get :show, :id => @ticket.id
      assigns[:ticket].should == @ticket
    end

  end
end
