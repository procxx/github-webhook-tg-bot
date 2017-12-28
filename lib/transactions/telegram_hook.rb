class Transactions::TelegramHook
  include Dry::Transaction(container: Container)

  step :select_command
  step :send_message, with: "operations.telegram.api.send_message"

  def select_command(input)
    if input[:text]
      command = case 
        when input[:text].start_with?('/newintegration')
          Container['operations.telegram.commands.create_integration']
        when input[:text].start_with?('/listintegrations')
          Container['operations.telegram.commands.list_integrations']
        end
      
      command.call(chat_id: input[:chat][:id])
    end
  end
end
