namespace :projects do
  desc 'Import from 24 Pull Requests'
  task import_from_24pr: :environment do
    47.times do |page|
      resp = RestClient.get "http://24pullrequests.com/projects.json?page=#{page+1}"
      projects = JSON.parse resp
      projects.each do |project|
        url = project['github_url']
        puts url
        github_project = GithubProject.new(url)
        unless github_project.find
          github_project.create rescue nil
        end
      end
    end
  end

  desc 'Re-calculate project scores'
  task recalculate_scores: :environment do
    Project.needs_update.each(&:update_info)
  end

  desc 'refresh issue ids relative to repositories'
  task refresh_issues: :environment do
    require 'ostruct'

    client = Octokit::Client.new(access_token: ENV['OCTOKIT_TOKEN'])

    Project.all.each do |project|
      repo = "#{project.owner}/#{project.name}"
      client.issues(repo, state: 'open').first(5).each do |github_issue|
        issue = Issue.find_by_github_id(github_issue.id)
        if issue
          issue.number = github_issue.number
          issue.save!
        end
      end
    end
  end
end
