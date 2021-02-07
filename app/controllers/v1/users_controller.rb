class V1::UsersController < ApplicationController
  before_action :validate_user, except: [:index, :login]
  before_action :set_user, only: [:update]
  #before_action :authenticate, except: [:create, :login]

  def index
    @users = User.all
  end

  def login
    @user = User.find_by(email: login_params[:email])
    return render json: { message: I18n.t("credentials.invalid") }, status: :bad_request unless @user.present?

    if @user.valid_password?(login_params[:password])
      @token = Token.new(user_id: @user.id)
      if @token.save
        render :show, status: :ok
      else
        render json: { message: I18n.t("credentials.invalid") }, status: :bad_request
      end
    else
      render json: { message: I18n.t("credentials.user_invalid") }, status: :bad_request
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @token = Token.new user_id: @user.id  # new -> #create -> #save
      if @token.save
        render :show, status: :created
      else
        render json: { response: t("credentials.error"), status: :bad_request }, status: :bad_request
      end
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.id == @current_user.id
      if @user.valid?
        @user.update(user_params)
        render :update
      else
        render json: @user.errors.message, status: :bad_request
      end
    else
      head :unauthorized
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

  def validate_user
    if !params[:user].present?
      render json: { :message => t("messages.add_name") }, status: :bad_request
    end
  end

  def set_user
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { :message => t("messages.dont_find") }, status: :bad_request
    end
  end
end
