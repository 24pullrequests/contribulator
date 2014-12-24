namespace :projects do
  desc 'Import from 24 Pull Requests'
  task import_from_24pr: :environment do
    26.times do |page|
      resp = RestClient.get "http://24pullrequests.com/projects.json?page=#{page+1}"
      projects = JSON.parse resp
      projects.each do |project|
        url = project['github_url']
        puts url
        unless Project.find_from_github_url(url)
          Project.create_from_github_url(url)
        end
      end
    end
  end
end
