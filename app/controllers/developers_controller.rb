class DevelopersController < ApplicationController
  def index
    @api_key = current_user.api_key
  end

  def create_key
    current_user.api_key = SecureRandom.alphanumeric(32)
    if current_user.save
      flash[:notice] = "Api key gerada com sucesso"
    else
      flash[:alert] = "Erro ao gerar API key"
    end

    redirect_to developers_path
  end
end
