class Api::GithubController < ActionController::API
  def hook
    Rails.logger.info params.inspect
    head :no_content
  end
end
