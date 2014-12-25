class Project < ActiveRecord::Base
  validates :name, :owner, presence: true

  after_create :update_info

  def self.create_from_github_url(url)
    create parse_github_url(url)
  end

  def self.find_from_github_url(url)
    find_by parse_github_url(url)
  end

  def self.parse_github_url(url)
    url.gsub!(/^(((https|http|git)?:\/\/(www\.)?)|git@)github.com(:|\/)/i, '')
    url.gsub!(/(\.git|\/)$/i, '')
    parts = url.split('/')
    { owner: parts[0], name: parts[1] }
  end

  def to_s
    name_with_owner
  end

  def name_with_owner
    "#{owner}/#{name}"
  end

  def github_url
    "https://github.com/#{name_with_owner}"
  end

  def update_info
    update_from_github
    update_score
  end

  def repo_id
    github_id || name_with_owner
  end

  def summary
    calculator.summary
  end

  def github_client
    @client ||= Octokit::Client.new(access_token: ENV['OCTOKIT_TOKEN'])
  end

  def has_issues?
    repo['has_issues']
  end

  private

  def update_from_github
    update_attributes(
    github_id:     repo[:id],
    name:          repo[:name],
    owner:         repo[:owner][:login],
    description:   repo[:description],
    homepage:      repo[:homepage],
    fork:          repo[:fork],
    main_language: repo[:language]
    )
  end

  def update_score
    update_attributes score: calculator.score
  end

  def calculator
    @calculator ||= ScoreCalculator.new(self)
  end

  def repo
    @repo ||= github_client.repo(repo_id)
  end
end
