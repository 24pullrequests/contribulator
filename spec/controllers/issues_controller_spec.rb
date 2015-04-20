require 'rails_helper'

RSpec.describe IssuesController, :type => :controller do
  describe "GET #show" do
    let(:issue) { create(:issue) }

    before do
        get :show, id: issue.id
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(response).to render_template("show")
    end

    it "loads all of the issue into @issue" do
      expect(assigns(:issue)).to match(issue)
    end
  end
end
