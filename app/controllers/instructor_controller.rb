class InstructorController < ApplicationController
  def edit
    @instructor = Instructor.find(params[:id])
  end

  def show
    @instructor = Instructor.find(params[:id])
  end
end
