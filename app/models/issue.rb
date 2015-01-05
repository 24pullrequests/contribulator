class Issue < ActiveRecord::Base
  validates :github_id, :url, :title, presence: true
  belongs_to :project

  def self.create_or_update_from(issue, project)
    find_or_create_by(github_id: issue.id) do |item|
      item.url       = issue[:html_url]
      item.title     = issue[:title]
      item.state     = issue[:state]
      item.comments  = issue[:comments]
      item.closed_at = issue[:closed_at]
      item.body      = issue[:body]
      item.project   = project
    end
  end
end
