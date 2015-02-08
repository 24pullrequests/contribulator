namespace :projects do
  desc 'Import from 24 Pull Requests'
  task import_from_24pr: :environment do
    26.times do |page|
      resp = RestClient.get "http://24pullrequests.com/projects.json?page=#{page+1}"
      projects = JSON.parse resp
      projects.each do |project|
        url = project['github_url']
        puts url
        github_project = GithubProject.new(url)
        unless github_project.find
          github_project.create
        end
      end
    end
  end

  desc 'Re-calculate project scores'
  task recalculate_scores: :environment do
    Project.needs_update.each(&:update_info)
  end
end
