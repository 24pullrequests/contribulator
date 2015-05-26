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

    describe "show by id" do
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

    describe "show by user/repo" do
      before do
        get :show, user: project.owner, repo: project.name
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

    describe "missing repo by user/repo" do
      it "redirects to a prompt screen before adding the repo" do
        get :show, user: 'foo', repo: 'bar'
        expect(response).to redirect_to(project_confirm_path(url: 'foo/bar'))
      end

      it "redirects on create action too" do
        get :create, project: { github_url: 'foo/bar' }
        expect(response).to redirect_to(project_confirm_path(url: 'foo/bar'))
      end

      it "doesn't attempt to add the project" do
        expect(Project.all.length).to eq(0)

        get :show, user: 'foo', repo: 'bar'

        expect(Project.all.length).to eq(0)
      end
    end
  end

  describe "GET #confirm" do
    it "redirects to the proejcts index if the url parameter is missing" do
      get :confirm
      expect(response).to redirect_to(projects_path)
    end

    it "displays a confirmation screen for adding a project" do
      get :confirm, url: 'foo/bar'
      expect(response).to have_http_status 200
    end
  end
end
