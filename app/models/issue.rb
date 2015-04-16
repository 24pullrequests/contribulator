class Issue < ActiveRecord::Base
  validates :github_id, :url, :title, :number, presence: true
  belongs_to :project

  def self.create_or_update_from(issue, project)
    find_or_create_by(github_id: issue.id) do |item|
      item.url        = issue[:html_url]
      item.number     = issue[:number]
      item.title      = issue[:title]
      item.state      = issue[:state]
      item.comments   = issue[:comments]
      item.closed_at  = issue[:closed_at]
      item.body       = issue[:body]
      item.created_at = issue[:created_at]
      item.updated_at = issue[:updated_at]
      item.project    = project
    end
  end

  def labels
    return [] if number.nil?
    github_client.issue("#{project.owner}/#{project.name}", number).labels.map(&:to_h)
  rescue => e
    puts e
    []
  end

  private

  def github_client
    @client ||= Octokit::Client.new(access_token: ENV['OCTOKIT_TOKEN'])
  end
end
