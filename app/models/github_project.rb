class GithubProject
  REPO_URL = /^\w+\/\w+/i
  GITHUB_URL = /^(((https|http|git)?:\/\/(www\.)?)|git@)github.com(:|\/)/i

  def initialize(url)
    @url = url
  end

  def valid_url?
    !!GITHUB_URL.match(@url) || !!REPO_URL.match(@url)
  end

  def find
    attrs = parse_github_url

    Project.find_by_owner_and_name(attrs[:owner], attrs[:name])
  end

  def create
    attrs = parse_github_url

    Project.create(attrs)
  end

  private

  def parse_github_url
    url = @url.gsub(GITHUB_URL, '')
    url = @url.gsub(/(\.git|\/)$/i, '')
    parts = url.split('/')

    { owner: parts[0], name: parts[1] }
  end
end
