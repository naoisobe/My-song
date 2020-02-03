class InstructorController < ApplicationController
  def edit
    @instructor = Instructor.find(params[:id])
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    if @instructor.update(instructor_params)
      redirect_to instructor_path(@instructor)
    else
      render 'edit'
    end
  end

  def ms_list
    @practice = Practice.all
    @instructor = Instructor.find(params[:id])
  end

  private
  
  def instructor_params
    params.require(:instructor).permit(:name, :description, :profile_image)
  end
end

