class Api::TelegramController < ActionController::API
  def hook
    Rails.logger.info params[:message]
    render json: {ok: true}, status: 200
  end
end
