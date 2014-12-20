class Project < ActiveRecord::Base
  validates :name, :owner, presence: true

  def to_s
    name_with_owner
  end

  def name_with_owner
    "#{owner}/#{name}"
  end

  def update_info
    update_from_github
    update_score
  end

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
    update_attributes score: ScoreCalculator.new(self).score
  end

  def repo_id
    github_id || name_with_owner
  end

  private

  def repo
    @repo ||= Octokit.repo(repo_id)
  end
end
