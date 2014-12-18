class Project < ActiveRecord::Base
  validates :name, :owner, presence: true

  def to_s
    name_with_owner
  end

  def name_with_owner
    "#{owner}/#{name}"
  end

  def language
    Linguist::Language[main_language]
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

  def calculate_score
    # number of open issues created in the past 6 month
    # number of commits on main branch  in the past 6 month
    # fork?
    # description present?
    # homepage present?
    # readme present?
    # Contributing present?
    # Licence present?
    # Changelog present?
    # Tests (test/spec) present?
  end

  private

  def repo
    @repo ||= Octokit.repo(github_id || name_with_owner)
  end
end
