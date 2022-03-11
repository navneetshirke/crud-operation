class Api::UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
    render json: { status: 200, users: @users }
  end

  def create
    User.create(user_params)
    render json: { status: 200, message: "User Created Sucessfully" }
  end

  def show
    render json: { status: 200, user: @user }
  end

  def update
    @user.update(user_params)
    render json: { status: 200, message: "User Updated Sucessfully" }
  end

  def destroy
    @user.destroy
    render json: { status: 200, message: "User Deleted Sucessfully"  }
  end

  def typeahead
    @users = User.where(
      "lower(firstName) LIKE ? OR lower(lastName) LIKE ? OR lower(email) LIKE ?",
      "%#{params[:input]}%", "%#{params[:input]}%", "%#{params[:input]}%"
      )
    render json: { status: 200, users: @users }
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
    unless @user.present?
      render json: { status: 200, message: "Record Not Found" }
    end
  end

  def user_params
    params.permit(:firstName, :lastName, :email)
  end

end
