require "rails_helper"

RSpec.describe ProjectsController, :type => :controller do
  describe "GET #index" do
    let(:project) { create(:project) }

    before do
      get :index
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    it "loads all of the projects into @projects" do
      expect(assigns(:projects)).to match_array([project])
    end
  end

  describe "GET #show" do
    let(:project) { create(:project) }

    before do
      get :show, id: project.id
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(response).to render_template("show")
    end

    it "loads all of the project into @project" do
      expect(assigns(:project)).to match(project)
    end
  end

end
