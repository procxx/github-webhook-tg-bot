class Api::GithubController < ActionController::API
  def hook
    Rails.logger.info request.headers['HTTP_X_GITHUB_EVENT']
    # url: Rails.application.routes.url_helpers.api_github_hook_url(integration: '111')
    render json: {ok: true}, status: 200
  end
end
