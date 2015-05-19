class PagesController < ApplicationController
  def about
    @project   = Project.good.sample
    @languages = Project.languages
    @issue     = @project.issues.sample
  end

  private

  def github
    @github ||= Octokit::Client.new(access_token: ENV['OCTOKIT_TOKEN'])
  end
end
