class BusesController < ApplicationController
  def index
  	@buses = HrtBus::Bus.active_buses.select {|bus| bus.route_id == params[:route_id]}

  	if @buses.blank?
  		flash[:notice] = "Sorry, no buses where found on the given route"
  	end

  	@buses.each do |bus|
	  	File.new("./tmp/map_#{bus.id}.png", "w+") do |f|
				f.write(bus.static_map)
				f.save
				f.close
			end
		end
  end

  def show
  end

end
