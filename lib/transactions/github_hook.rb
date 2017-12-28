module Transactions
  class GithubHook
    include Dry::Transaction(container: Container)

    step :watch, with: "operations.github.events.watch"
    step :send_message, with: "operations.telegram.api.send_message"
    # step :persist, with: "operations.persist"
  end
end