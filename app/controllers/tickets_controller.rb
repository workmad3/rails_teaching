class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def show
  end

  def index
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
