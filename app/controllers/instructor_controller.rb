class InstructorController < ApplicationController
  before_action :authenticate_instructor!, only: %i[edit ms_list update]
  before_action :set_instructor, only: %i[edit show update]

  def edit
  end

  def show
  end

  def update
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

  def set_instructor
    @instructor = Instructor.find(params[:id])
  end
end
