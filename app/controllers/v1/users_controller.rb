class V1::UsersController < ApplicationController
  before_action :authenticate!, only: %i[update]
  before_action :set_user, only: [:update]
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def login
    @user = User.find_by(email: login_params[:email])
    return render json: { message: I18n.t("credentials.invalid") }, status: :bad_request unless @user.present?
    if @user.valid_password?(login_params[:password])
      render :show, status: :ok
    else
      render json: { message: I18n.t("credentials.user_invalid") }, status: :bad_request
    end
  end

  def create
    @user = Owner.new(user_params)
    if @user.save
      render :show, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.valid?
      @user.update(user_params)
      render :update
    else
      render json: @user.errors.message, status: :bad_request
    end
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end

  def user_params
    params.require(:user).permit(:email, :password,
                                 organization_attributes: [
                                   :name,
                                 ])
  end

  def set_user
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { :message => t("messages.dont_find") }, status: :bad_request
    end
  end
end
