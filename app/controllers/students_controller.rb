class StudentsController < ApplicationController
  def index
    if params[:name].present?
      students = Student.where('first_name LIKE ? OR last_name LIKE ?', "%#{params[:name]}%", "%#{params[:name]}%")
    else
      students = Student.all
    end
    render json: students
  end

  def show
    student = Student.find_by(id: params[:id])
    if student
      render json: student
    else
      render json: { error: 'Student not found' }, status: :not_found
    end
  end
end
