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
      if token.nil?
        head :unauthorized
      else
        instance_variable_set("@current_#{set_type(token)}", token.entity)
      end
    else
      head :unauthorized
    end
  end

  def set_type(token)
    current_type[token.entity.class.name.to_sym]
  end

  def current_type
    {
      Owner: :user,
      Organization: :organization,
      Device: :device
    }
  end
end
