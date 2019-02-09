class StudentsController < ApplicationController
  before_action :authorize_admin, only: [:create, :update, :index, :edit]

  def index
    @students = Student.all
    @students = @students.paginate(page: params[:page]).order("created_at DESC").per_page(5)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    if Student.find_by(student_code: @student.student_code) != nil
        flash[:notice] = "Student ID is already taken."
        render "new"
      else
        @student.save
        flash[:notice] = "Student was successfully created."
        redirect_to students_path
    end
  end

  def update
    @student = Student.find(params[:id])
      if @student.update(student_params)
        flash[:notice] = "Student was updated successfully."
        redirect_to students_path
      end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authorize_admin
      return unless !current_user.admin?
      redirect_to root_path, alert: 'Admins only!'
    end

    def student_params
      params.require(:student).permit(:student_name, :student_code)
    end
end
