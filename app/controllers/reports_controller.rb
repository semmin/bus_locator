class ReportsController < ApplicationController
  layout nil, only: :new

  def index
    @report = Report.new(route_id: params[:route_id])
  end

  def create
    report_params = { route_id: params[:routeNumber],
                      comment: params[:comments],
                      lat: params[:userLat],
                      lon: params[:userLong] }
    @report = Report.new(report_params)
    if @report.save
      redirect_to report_path(id: @report.id), notice: "You successfully submited bus report."
    else
      redirect_to root_path
    end
  end

  def show
    @report = Report.find(params[:id])
  end

end
