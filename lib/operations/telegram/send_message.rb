require "dry/transaction/operation"

module Operations
  module Telegram
    class SendMessage
      include Dry::Transaction::Operation

      def call(input)
        p "befor call #{input.inspect}"
        res = ::Telegram::Api.new.send_message(input).to_s
        Right(input.merge(res: res))
      end
    end
  end
end
