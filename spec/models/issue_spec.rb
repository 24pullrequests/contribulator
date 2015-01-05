require 'rails_helper'

RSpec.describe Issue, :type => :model do
  let(:issue) { create(:issue) }

  %w[github_id url title].each do |required|
    it "requires #{required}" do
      bad_issue = build(:issue, required.to_sym => nil)
      expect(bad_issue).to be_invalid
    end
  end
end
