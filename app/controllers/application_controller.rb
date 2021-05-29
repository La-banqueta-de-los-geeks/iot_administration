class ApplicationController < ActionController::API
  private

  rescue_from CanCan::AccessDenied do |_exception|
    render json: { message: I18n.t('rules.dont_permission') }, status: :unauthorized
  end

  def current_ability
    @current_ability ||= Ability.new(@current_user)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def authenticate!
    authorization = request.headers['Authorization']
    if authorization.present?
      authorization = authorization.sub('Bearer ', '')
      token = Token.find_by(token: authorization)
      if token.nil? && !token.is_valid?
        head :unauthorized
      else
        @current_user = token.user
      end
    else
      head :unauthorized
    end
  end
end
