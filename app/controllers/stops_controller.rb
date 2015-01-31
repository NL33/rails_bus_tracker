class StopsController < ApplicationController
  
  def index  
    @stops = Stop.all  #No need to specify render
  end

  def new 
    @stop = Stop.new #No need to specify render
  end

  def create
    @stop = Stop.new(stop_params)  #stop_params replaces params[:stop], referencing method below
    if @stop.save
      flash[:notice] = "stop created."
      redirect_to stops_path #replacing what would have been redirect_to (/stops)
    else
      render 'new' #replacing render('stops/new.html.erb')
    end
  end

  def show
    @stop = Stop.find(params[:id]) 
    @station = Station.where(:id => @stop.station_id).first
    @line = Line.where(:id => @stop.line_id).first
    render('stops/show.html.erb')
  end

  def edit 
    @stop = Stop.find(params[:id])
  end

  def update 
    @stop = Stop.find(params[:id])
    if @stop.update(stop_params)
      flash[:notice] = "Stop updated."
      redirect_to stop_path(@stop)
    else
      render 'edit'
    end
  end

 def destroy 
    @stop = Stop.find(params[:id])
    @stop.destroy
     flash[:notice] = "stop Deleted"
    redirect_to stops_path
 end

 private

    def stop_params
      params.require(:stop).permit(:station_id, :line_id)
    end
end