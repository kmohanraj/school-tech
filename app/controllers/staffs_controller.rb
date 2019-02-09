class StaffsController < ApplicationController

  def index
  	@users = User.where(role: "user")
  	@assigned_subjects = AssignSubject.where(user_id: current_user.id)
  	if current_user.admin?
  	  @assigned_marks = AssignMark.all
  	  @assigned_subjects = AssignSubject.all
  	  @students = Student.all
  	  @rank_lists = RankList.all.order("total DESC")
  	else
      @assigned_marks = AssignMark.where(user_id: current_user.id)
  	end
  end

  def new 
  	@user = User.new
  end

  def create
  	@user = User.new(sign_up_params)
  	if @user.save
  		flash[:notice] = "Staff was created successfully."
  		redirect_to staffs_path
  	else
  		flash[:notice] = "Staff email already exists."
  		render "new"
  	end
  end

  def new_mark
  	@assign_mark = AssignMark.new
  	@assigned_subject = AssignSubject.find_by(id: params[:id])
  end

  def assign_mark
  	@assigned_subject = AssignSubject.find_by(id: params[:id])
  	@assign_mark = AssignMark.new(assign_params)
  	@assign_mark.user_id = current_user.id
    if @assign_mark.student_id.nil?
		flash[:notice] = "Please select student id."
        render "new_mark"
  	elsif AssignMark.find_by(student_id: @assign_mark.student_id, subject_id: @assign_mark.subject_id) != nil
	    flash[:notice] = "Student ID is already taken."
        render "new_mark"
	else	    	
    	@assign_mark.save
	  	if RankList.find_by(student_id: @assign_mark.student_id) != nil
	  		@temp = RankList.find_by(student_id: @assign_mark.student_id)
	  		mark = AssignMark.where(student_id: @assign_mark.student_id).sum(:mark)
	  		@temp.update_attributes(student_id: @assign_mark.student_id, total: mark)
	  	else
	    	RankList.create(student_id: @assign_mark.student_id, total: @assign_mark.mark)
	    end
        flash[:notice] = "Mark was assigned successfully."
        redirect_to staffs_path
    end
  end

  def edit
  	@assign_mark = AssignMark.find(params[:id])
  	@subject = Subject.find_by(id: @assign_mark.subject_id)
  end

  def assign_edit
  	@assign_mark = AssignMark.find(params[:id])
    if @assign_mark.update(assign_params)
    	@assign = AssignMark.find_by(student_id: @assign_mark.student_id)
    	@temp = RankList.find_by(student_id: @assign_mark.student_id)
        mark = AssignMark.where(student_id: @assign_mark.student_id).sum(:mark)
        @temp.update_attributes(student_id: @assign_mark.student_id, total: mark)
      flash[:notice] = "Student mark was updated successfully."
      redirect_to staffs_path
    end
  end

  def destroy
  	@user = User.find(params[:id])
  	if @user.destroy
  		flash[:notice] = "Student record deleted successfully"
  		redirect_to staffs_path
  	else
  		flash[:notice] = "something error"
  		redirect_to staffs_path
  	end
  end

 private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def assign_params
    params.require(:assign_mark).permit(:mark, :subject_id, :student_id)
  end

end
