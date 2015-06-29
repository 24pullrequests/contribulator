require 'rails_helper'

RSpec.describe Issue, type: :model do
  let(:issue) { create(:issue, number: 19663, project: create(:project, name: 'rails', owner: 'rails')) }

  %w[github_id url title].each do |required|
    it "requires #{required}" do
      bad_issue = build(:issue, required.to_sym => nil)
      expect(bad_issue).to be_invalid
    end
  end

  it "can fetch labels for the given issue", :vcr do
    expect(issue.labels).to match([{
      url: "https://api.github.com/repos/rails/rails/labels/activerecord",
      name: "activerecord",
      color: "0b02e1"
    },
    {
      url: "https://api.github.com/repos/rails/rails/labels/With%20reproduction%20steps",
      name: "With reproduction steps",
      color: "009800"
    }])
  end
end
