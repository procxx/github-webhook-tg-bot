class Api::TelegramController < ActionController::API
  def hook
    # Rails.logger.info params[:message]
    # render json: {value: params[:message]}
    Transactions::TelegramHook.new.call(params[:message]) do |m|
      m.success do |value|
        render json: {ok: true, value: value}
      end
      m.failure do |value|
        render json: {ok: false, value: value}
      end
    end
    
  end
end
