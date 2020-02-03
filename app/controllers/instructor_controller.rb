class InstructorController < ApplicationController
  def edit
    @instructor = Instructor.find(params[:id])
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def ms_list
    @practice = Practice.all
    @instructor = Instructor.find(params[:id])
  end
end
