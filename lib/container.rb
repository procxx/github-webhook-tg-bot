class Container
  extend Dry::Container::Mixin

  namespace :operations do
    namespace :github do
      namespace :events do |evt|
        evt.register "watch" do
          ::Operations::Github::Events::Watch.new
        end
      end
    end

    namespace :telegram do
      namespace :api do |api|
        api.register :send_message do
          ::Operations::Telegram::SendMessage.new
        end
      end

      namespace :commands do |cmd|
        cmd.register :create_integration do
          ::Operations::Telegram::CreateIntegration.new
        end
        cmd.register :list_integrations do
          ::Operations::Telegram::ListIntegration.new
        end
      end
    end
  end
  # namespace "operations" do |ops|
  #   ops.register "process" do
  #     Process.new
  #   end

  #   ops.register "validate" do
  #     Validate.new
  #   end

  #   ops.register "persist" do
  #     Persist.new
  #   end
  # end
end