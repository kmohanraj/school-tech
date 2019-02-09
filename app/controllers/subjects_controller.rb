class SubjectsController < ApplicationController
  before_action :authorize_admin, only: [:create, :update, :index, :edit]

  def index
    @subjects = Subject.all
    @subjects = @subjects.paginate(page: params[:page]).order("created_at DESC").per_page(5)
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def assign
    @assign_subject = AssignSubject.new
    @users = User.where.not(role: :admin)
  end

  def assign_subject
    @assign_subject = AssignSubject.new(assign_params)
    if @assign_subject.user_id.nil?
      flash[:notice] = "Can you please select a staff."
      render "assign"
    elsif AssignSubject.find_by(subject_id: @assign_subject.subject_id).present? 
      flash[:notice] = "Subject code is already assigned."
      render "assign"
    else
      @assign_subject.save
      flash[:notice] = "Subject code is was assigned successfully."
      redirect_to subjects_path
    end
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.user_id = current_user.id
    if Subject.find_by(sub_code: @subject.sub_code) != nil
        flash[:notice] = "Student code is already taken."
        render "new"
      else
        @subject.save
        flash[:notice] = "Subject was successfully created."
        redirect_to subjects_path
    end
  end

  def update
    @subject = Subject.find(params[:id])
      if @subject.update(subject_params)
        @subject.save
        flash[:notice] = "Subject was successfully updated."
        redirect_to subjects_path
      end
  end

  def destroy
    @subject = Subject.find(params[:id])
    if @subject.assign_subjects.count > 0
      flash[:notice] = "Subject was associated in teachers"
      redirect_to subjects_path
    else
      @subject.delete
      flash[:notice] = "Product was deleted successfully."
      redirect_to subjects_path
    end
  end

  private
    def subject_params
      params.require(:subject).permit(:sub_name, :sub_code)
    end
    def authorize_admin
      return unless !current_user.admin?
      redirect_to root_path, alert: 'Admins only!'
    end
    def assign_params
      params.require(:assign_subject).permit(:subject_id, :user_id)
    end
end
