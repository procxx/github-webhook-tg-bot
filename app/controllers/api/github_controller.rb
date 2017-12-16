class Api::GithubController < ActionController::API
  def hook
    Rails.logger.info request.headers['HTTP_X_GITHUB_EVENT']
    render json: {ok: true, url: api_github_hook_url}, status: 200
  end
end
