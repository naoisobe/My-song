class InstructorController < ApplicationController
  before_action :authenticate_instructor!, only: %I{edit ms_list}

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    if @instructor.update(instructor_params)
      flash[:notice] = "ユーザー情報が更新されました"
      redirect_to instructor_path(@instructor)
    else
      @error = @instructor
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
