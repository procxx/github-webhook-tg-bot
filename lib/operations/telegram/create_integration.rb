require "dry/transaction/operation"

module Operations
  class Telegram::CreateIntegration
    include Dry::Transaction::Operation

    def call(input)
      record = ::Telegram::Integration.new(channel_id: input[:chat_id])
      record.integration_key = SecureRandom.hex
      if record.save
        Right({
          text: "You webhook is #{Rails.application.routes.url_helpers.api_github_hook_url(integration_key: record.integration_key)}",
          chat_id: input[:chat_id]
        })
      else
        Left({text: "Can't create integration", chat_id: input[:chat_id]})
      end
    end
  end
end