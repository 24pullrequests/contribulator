require 'rails_helper'

describe ScoreCalculator do
  it "should reject invalid projects" do
    expect(-> { described_class.new(Object.new) }).to raise_error("Invalid type for ScoreCalculator, expected Project")
  end

  it "calculates scores" do
    VCR.use_cassette('project_github', match_requests_on: [:host, :path]) do
      calc = described_class.new(Project.create(name: 'rails', owner: 'rails'))
      expect(calc.score).to eq(21)
    end
  end

  it "returns a breakdown of criteria" do
    VCR.use_cassette('project_github', match_requests_on: [:host, :path]) do
      calc = described_class.new(Project.create(name: 'rails', owner: 'rails'))
      expect(calc.summary).to eq({
        fork: false,
        description_present: false,
        homepage_present: false,
        readme_present: true,
        contributing_present: true,
        license_present: false,
        changelog_present: false,
        tests_present: false,
        code_of_conduct_present: false,
        issues_enabled: true,
        open_issues_last_6_months: 0,
        master_commits_last_6_months: 30
      })
    end
  end
end
