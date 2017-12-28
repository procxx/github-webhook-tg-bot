require "dry/transaction/operation"

module Operations
  class Telegram::ListIntegration
    include Dry::Transaction::Operation

    def call(input)
      msg = ::Telegram::Integration.where(channel_id: input[:chat_id]).map do |int|
        "#{Rails.application.routes.url_helpers.api_github_hook_url(integration_key: int.integration_key)}"
      end.join("\n").presence || "No GitHub webhooks have been set up with this conversation."
      Right(text: msg, chat_id: input[:chat_id])
    end
  end
end