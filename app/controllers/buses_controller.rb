class BusesController < ApplicationController
  def index
    @buses = HrtBus::Bus.all
    @buses.each do |bus|
      if bus.route_id.blank?
        ra = RouteAssignment.where(lat: bus.lat, lon: bus.lon).first
        bus.route_id = ra.route_number if ra.present?
      end
    end
  	@buses = HrtBus::Bus.active_buses.select {|bus| bus.route_id == params[:route_id]}
    @bus = @buses.last if @buses.present?

  	if @buses.blank?
  		flash[:notice] = "Sorry, no buses where found on the given route"
  	end


  end

  def show
  end

end
