class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def show 
    @ticket=Ticket.find(params[:id])
  end

  def index
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.save
    redirect_to @ticket, :notice => "ticket is created"
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
