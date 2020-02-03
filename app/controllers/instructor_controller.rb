class InstructorController < ApplicationController
  def edit
  end

  def show
    @instructor = Instructor.find(params[:id])
  end
end
