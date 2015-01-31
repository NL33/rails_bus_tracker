class StationsController < ApplicationController
  
  def index
    @stations = Station.all  #No need to specify render
  end

  def new 
    @station = Station.new #No need to specify render
  end

  def create
    @station = Station.new(station_params)  #station_params replaces params[:station], referencing method below
    if @station.save
      flash[:notice] = "Station created."
      redirect_to stations_path #replacing what would have been redirect_to (/stations)
    else
      render 'new' #replacing render('stations/new.html.erb')
    end
  end

  def show
    @station = Station.find(params[:id]) 
  end

  def edit 
    @station = Station.find(params[:id])
  end

  def update 
    @station = station.find(params[:id])
    if @station.update(params[:station])
      flash[:notice] = "Station updated."
      redirect_to station_path(@station)
    else
      render 'edit'
    end
  end

 def destroy 
    @station = station.find(params[:id])
    @station.destroy
     flash[:notice] = "station Deleted"
    redirect_to stations_path
 end

 private

    def station_params
      params.require(:station).permit(:name)
    end
end