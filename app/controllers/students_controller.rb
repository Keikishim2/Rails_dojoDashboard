class StudentsController < ApplicationController
  def show
		@this_student = Student.find(params[:student_id])
		@this_dojo = Dojo.find(params[:dojo_id])
		@these_students = @this_dojo.students.where.not(id: params[:student_id])
	end

	def new
		@this_dojo = Dojo.find(params[:dojo_id])
	end

	def edit
		@this_student = Student.find(params[:student_id])
		@this_dojo = Dojo.find(params[:dojo_id])
		@all_dojos = Dojo.where.not(id: @this_dojo.id)
	end

	def create
    	new_student = Student.create(student_params)
	    if new_student.valid?
	    	return redirect_to "/dojos/#{params[:dojo_id]}" 
	    end 
    	flash[:errors] = new_student.errors.full_messages
    	return redirect_to :back
	end

	def update
		update_student = Student.update(params[:student_id], student_params)
		if update_student.valid?
			return redirect_to "/dojos/#{params[:dojo_id]}/students/#{params[:student_id]}" 
		end
    	flash[:errors] = update_student.errors.full_messages
		redirect_to :back
	end

	def delete
		Student.find(params[:student_id]).destroy
		redirect_to "/dojos/#{params[:dojo_id]}"
	end

	private
		def student_params
			params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
		end
end