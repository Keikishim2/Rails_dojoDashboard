class DojosController < ApplicationController
	def index
		@all_dojos = Dojo.all
		@count = Dojo.count
	end

	def new
	end

	def create
    	new_dojo = Dojo.create(dojo_params)
	    return redirect_to "/dojos" if new_dojo.valid?
    	flash[:errors] = new_dojo.errors.full_messages
    	return redirect_to "/dojos/new"
	end

	def show
		@this_dojo = Dojo.find(params[:id])
		@all_students = Student.where(dojo: params[:id])
		p @all_students
	end

	def edit
		@this_dojo = Dojo.find(params[:id])
	end

	def update
		update_dojo = Dojo.update(params[:id], dojo_params)
		if update_dojo.valid?
			flash[:success] = "Thanks for updating dojo!"
			return redirect_to "/dojos"
		end

		# Otherwise there were errors
		flash[:errors] = update_dojo.errors.full_messages
		redirect_to :back
	end

	def delete
		Dojo.find(params[:id]).destroy
		redirect_to "/dojos"
	end
	private
		def dojo_params
			params.require(:dojo).permit(:branch, :street, :city, :state)
	end
end