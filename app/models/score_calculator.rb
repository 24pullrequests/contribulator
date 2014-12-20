class ScoreCalculator
  attr_accessor :project

  def initialize(project)
    @project = project
  end

  def score
    [
      fork? ? 0 : 1,
      description_present? ? 1 : 0,
      homepage_present? ? 1 : 0,
      readme_present? ? 5 : 0,
      contributing_present? ? 5 : 0,
      licence_present? ? 5 : 0,
      changelog_present? ? 1 : 0,
      tests_present? ? 5 : 0
    ].sum
  end

  def summary
    {
      fork: fork?,
      description_present: description_present?,
      homepage_present: homepage_present?,
      readme_present: readme_present?,
      contributing_present: contributing_present?,
      licence_present: licence_present?,
      changelog_present: changelog_present?,
      tests_present: tests_present?
    }
  end

  private

  def fork?
    project.fork?
  end

  def description_present?
    project.description.present?
  end

  def homepage_present?
    project.homepage.present?
  end

  def readme_present?
    file_exists?('readme')
  end

  def contributing_present?
    file_exists?('contributing')
  end

  def licence_present?
    file_exists?('licence')
  end

  def changelog_present?
    file_exists?('changelog')
  end

  def tests_present?
    folder_exists?('test') || folder_exists?('spec')
  end

  # number of open issues created in the past 6 month
  # number of commits on main branch  in the past 6 month

  def github_client
    Octokit
  end

  def ls
    @ls ||= github_client.contents(project.repo_id, path: '/')
  end

  def files
    ls.select { |f| f[:type] == 'file' }.map { |f| f[:path] }
  end

  def folders
    ls.select { |f| f[:type] == 'dir' }.map { |f| f[:path] }
  end

  def file_exists?(name)
    files.find { |f| f.match(/#{name}/i) }
  end

  def folder_exists?(name)
    folders.find { |f| f.match(/#{name}/i) }
  end
end
