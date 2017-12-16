class Telegram::Api
  BASE_URL = 'https://api.telegram.org'.freeze

  def getMe
    _make_request('getMe')
  end

  def webhook(url, enable)
    if enable
      _make_request('setWebhook', {url: url})
    else
      _make_request('setWebhook', {url: ''})
    end
  end

  private
  def _make_request(action, params={})
    HTTP.post(_make_url(action), params: params)
  end

  def _make_url(action)
    if Rails.application.credentials.telegram_bot_key.present?
      "#{BASE_URL}/bot#{Rails.application.credentials.telegram_bot_key}/#{action}"
    else
      raise "Setup telegram_bot_key in credentials"
    end
  end
end
