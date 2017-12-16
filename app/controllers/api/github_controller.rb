class Api::GithubController < ActionController::API
  def hook
    Rails.logger.info request.headers['X-GitHub-Event']
    render json: {status: :ok}, status: 200
  end
end
