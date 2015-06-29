require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET #about" do
    let(:issue) { create(:issue, project: create(:project, owner: 'rails', name: 'rails')) }
    let(:project) { issue.project }
    let(:languages) { Project.languages }

    before do
      allow(Project).to receive(:good).and_return([project])

        get :about
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(response).to render_template("about")
    end

    it "loads all of the languages into @languages" do
      expect(assigns(:languages)).to match(languages)
    end

    it "loads all of the issue into @issue" do
      expect(assigns(:issue)).to match(issue)
    end

    it "loads a of the project into @project" do
      expect(assigns(:project)).to match(project)
    end
  end
end
