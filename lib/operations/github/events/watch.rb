require "dry/transaction/operation"

module Operations
  module Github
    module Events
      class Watch
        include Dry::Transaction::Operation

        def call(input)
          p "WatchEvent"
          p input
          Right(input: input)
        end
      end
    end
  end
end
