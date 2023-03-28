class ApplicationController < ActionController::Base
  before_action :authenticate!
  layout :set_layout
  def set_layout
    current_user.present? ? "signed_in" : "application"
  end

  def after_sign_in_path_for(resource)
    movies_path
  end

  def authenticate!
    if request.format == Mime[:json]
      check_api_key
    else
      authenticate_user!
    end
  end

  def check_api_key
    user = authenticate_with_http_token { |t,_| User.find_by(api_key: t)}
    if user
      @current_user = user
    else
      render json: {erro: "Not authorized"}, status: :unauthorized
    end
  end
end
