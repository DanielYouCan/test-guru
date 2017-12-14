class GitHubClient < Octokit::Client

  ROOT_ENDPOINT = "https://api.github.com"
  ACCESS_TOKEN = '8b41a590169ebd2d9e2da3cd7ffd76a8851921ce'

  def initialize
    super
    setup_git_client
  end

  private

  def setup_git_client
    Octokit.configure do |c|
      c.api_endpoint =  ROOT_ENDPOINT
    end

    @access_token = ACCESS_TOKEN
  end

end
