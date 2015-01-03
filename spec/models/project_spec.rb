require 'rails_helper'

RSpec.describe Project, :type => :model do
  let(:project) { create(:project) }

  describe "attributes" do
    it "has an owner" do
      expect(project).to respond_to(:owner)
    end
    it "has a name" do
      expect(project).to respond_to(:name)
    end
    it "has last_scored" do
      expect(project).to respond_to(:last_scored)
    end

    it "validates the presence of name" do
      expect(build(:project, name: nil)).to be_invalid
    end

    it "validates the presence of owner" do
      expect(build(:project, owner: nil)).to be_invalid
    end
  end
end
