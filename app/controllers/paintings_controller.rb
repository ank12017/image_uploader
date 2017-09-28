class PaintingsController < ApplicationController
	
	def index
		@paintings = Painting.all
	end
	def show
		@painting = Painting.find(params[:id])
	end

	def new
		@painting = Painting.new
	end
	def edit
		 @painting = Painting.find(params[:id])
	end
	def create
		@painting = Painting.new(painting_params)
       
         if @painting.save
            redirect_to @painting
	      else
	      	render 'new'
         end
    end
     def update
	    @painting = Painting.find(params[:id])
	 
	  if @painting.update(painting_params)
	    redirect_to @painting
	  else
	    render 'edit'
	  end
	end
def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
 
    redirect_to paintings_path
  end
	private
    def painting_params
      params.require(:painting).permit(:image)
    end


 
end
