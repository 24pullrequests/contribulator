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
  end
end
