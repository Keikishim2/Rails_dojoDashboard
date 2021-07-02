class DojoControllerController < ApplicationController
  def index
    @dojo_controller = Dojo.all
    render "index"
  end
  def new
    render "new"
  end
  def create
    @dojo_controller = Dojo.create( new_dojo )
    if @dojo_controller.valid?
      redirect_to "/dojos"
    elsif @dojo_controller.errors
      flash[:errors] = @dojo_controller.errors.full_messages
      redirect_to "/dojos/new"
    end
  end
  def show
    @dojo_controller = Dojo.find(params[:id])
    render "show"
  end
  def edit
    @dojo_controller = Dojo.find(params[:id])
    render "edit"
  end
  def destroy
    @dojo_controller = Dojo.find(params[:id])
    @dojo_controller.destroy
    redirect_to "/dojos"
  end
  private
  def new_dojo
    params.require(:dojo).permit(:branch, :city, :state)
  end
end
