class LinesController < ApplicationController
  
  def index 
    @lines = Line.all  #No need to specify render
  end

  def new 
    @line = Line.new #No need to specify render
  end

  def create
    @line = Line.new(line_params)  #line_params replaces params[:line], referencing method below
    if @line.save
      flash[:notice] = "Line created."
      redirect_to lines_path #replacing what would have been redirect_to (/lines)
    else
      render 'new' #replacing render('lines/new.html.erb')
    end
  end

  def show
    @line = Line.find(params[:id]) 
    render('lines/show.html.erb')
  end

  def edit 
    @line = Line.find(params[:id])
  end

  def update 
    @line = Line.find(params[:id])
    if @line.update(line_params)
     flash[:notice] = "Line updated."
      redirect_to line_path(@line)
    else
      render 'edit'
    end
  end

 def destroy 
    @line = Line.find(params[:id])
    @line.destroy
     flash[:notice] = "line Deleted"
    redirect_to lines_path
 end

 private

    def line_params
      params.require(:line).permit(:name, station_ids: [])
    end
end