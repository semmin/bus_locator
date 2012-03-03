class BusesController < ApplicationController
  def index
  	@buses = HrtBus::Bus.active_buses.select {|bus| bus.route_id == params[:route_id]}

  	if @buses.blank?
  		flash[:notice] = "Sorry, no buses where found on the given route"
  	end
  end

  def show
  end

end
